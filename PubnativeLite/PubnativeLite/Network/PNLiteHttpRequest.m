//
//  Copyright © 2018 PubNative. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "PNLiteHttpRequest.h"
#import "PNLiteReachability.h"
#import "PNLiteCryptoUtils.h"
#import "HyBidLogger.h"
#import "HyBidWebBrowserUserAgentInfo.h"

NSTimeInterval const PNLiteHttpRequestDefaultTimeout = 60;
NSURLRequestCachePolicy const PNLiteHttpRequestDefaultCachePolicy = NSURLRequestUseProtocolCachePolicy;
NSInteger const MAX_RETRIES = 1;

@interface PNLiteHttpRequest ()

@property (nonatomic, strong) NSObject<PNLiteHttpRequestDelegate> *delegate;
@property (nonatomic, strong) NSString *method;
@property (nonatomic, assign) NSInteger retryCount;

@end

@implementation PNLiteHttpRequest

- (void)dealloc
{
    self.delegate = nil;
    self.urlString = nil;
    self.method = nil;
    self.header = nil;
    self.body = nil;
}

- (void)startWithUrlString:(NSString *)urlString withMethod:(NSString *)method delegate:(NSObject<PNLiteHttpRequestDelegate> *)delegate
{
    self.delegate = delegate;
    self.urlString = urlString;
    self.method = method;
    
    if (!self.delegate) {
        [HyBidLogger warningLogFromClass:NSStringFromClass([self class]) fromMethod:NSStringFromSelector(_cmd) withMessage:@"Delegate is nil, dropping the call."];
    } else if(!self.urlString || self.urlString.length <= 0) {
        [self invokeFailWithMessage:@"URL is nil or empty." andAttemptRetry:NO];
    } else if(![self.method isEqualToString:@"GET"] && ![self.method isEqualToString:@"POST"] && ![self.method isEqualToString:@"DELETE"]) {
        [self invokeFailWithMessage:@"Unsupported HTTP method, dropping the call." andAttemptRetry:NO];
    } else {
        PNLiteReachability *reachability = [PNLiteReachability reachabilityForInternetConnection];
        [reachability startNotifier];
        if([reachability currentReachabilityStatus] == PNLiteNetworkStatus_NotReachable) {
            [reachability stopNotifier];
            [self invokeFailWithMessage:@"Internet is not available." andAttemptRetry:YES];
        } else {
            [reachability stopNotifier];
            [self executeAsyncRequest];
        }
    }
}

- (void)executeAsyncRequest
{
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self makeRequest];
        });
    });
}

- (void)makeRequest
{
    NSURL *url = [NSURL URLWithString:self.urlString];
    if (!url) {
        NSString *message = [NSString stringWithFormat:@"URL cannot be parsed: %@", self.urlString];
        [self invokeFailWithMessage:message andAttemptRetry:NO];
    } else {
        NSURLSession *session = [NSURLSession sharedSession];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:url];
        [request setCachePolicy:PNLiteHttpRequestDefaultCachePolicy];
        [request setValue: HyBidWebBrowserUserAgentInfo.userAgent forHTTPHeaderField:@"User-Agent"];
        [request setTimeoutInterval:PNLiteHttpRequestDefaultTimeout];
        [request setValue: HyBidWebBrowserUserAgentInfo.hyBidUserAgent forHTTPHeaderField:@"User-Agent"];
        [request setHTTPMethod:self.method];
        if (self.header && self.header.count > 0) {
            for (NSString *key in self.header) {
                id value = self.header[key];
                [HyBidLogger debugLogFromClass:NSStringFromClass([self class]) fromMethod:NSStringFromSelector(_cmd) withMessage:[NSString stringWithFormat:@"Value: %@ for key: %@", value, key]];
                [request setValue:value forHTTPHeaderField:key];
            }
        }
        if (self.body) {
            [request setHTTPBody:self.body];
            [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)[self.body length]] forHTTPHeaderField:@"Content-Length"];
            [request setValue:[PNLiteCryptoUtils md5WithString:[[NSString alloc] initWithData:self.body encoding:NSUTF8StringEncoding]] forHTTPHeaderField:@"Content-MD5"];
        }
    
        [[session dataTaskWithRequest:request
                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                        if (error) {
                            [self invokeFailWithError:error andAttemptRetry:NO];
                        } else {
                            dispatch_async(dispatch_get_main_queue(), ^{
                                [self invokeFinishWithData:data statusCode:httpResponse.statusCode];
                            });
                        }
                    }] resume];
    }
}

- (void)invokeFinishWithData:(NSData *)data statusCode:(NSInteger)statusCode
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(request:didFinishWithData:statusCode:)]) {
        [self.delegate request:self didFinishWithData:data statusCode:statusCode];
    }
    self.delegate = nil;
}

- (void)invokeFailWithMessage:(NSString *)message andAttemptRetry:(BOOL)retry
{
    NSError *error = [NSError errorWithDomain:message code:0 userInfo:nil];
    [self invokeFailWithError:error andAttemptRetry:retry];
}

- (void)invokeFailWithError:(NSError *)error andAttemptRetry:(BOOL)retry
{
    [HyBidLogger errorLogFromClass:NSStringFromClass([self class]) fromMethod:NSStringFromSelector(_cmd) withMessage:[NSString stringWithFormat:@"HTTP Request failed with error: %@", error.localizedDescription]];

    if (self.shouldRetry && self.retryCount < MAX_RETRIES && retry) {
        self.retryCount++;
        [self executeAsyncRequest];
    } else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(request:didFailWithError:)]) {
            [self.delegate request:self didFailWithError:error];
        }
        self.delegate = nil;
    }
}

@end
