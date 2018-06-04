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

#import "PNLiteRevokeConsentRequest.h"
#import "PNLiteHttpRequest.h"
#import "PNLiteConsentEndpoints.h"

@interface PNLiteRevokeConsentRequest() <PNLiteHttpRequestDelegate>

@property (nonatomic, weak) NSObject <PNLiteRevokeConsentRequestDelegate> *delegate;

@end

@implementation PNLiteRevokeConsentRequest

- (void)revokeConsentRequestWithDelegate:(NSObject<PNLiteRevokeConsentRequestDelegate> *)delegate
                            withAppToken:(NSString *)appToken
                            withDeviceID:(NSString *)deviceID
                        withDeviceIDType:(NSString *)deviceIDType
{
    if (appToken == nil || appToken.length == 0 ||
        deviceID == nil || deviceID.length == 0 ||
        deviceIDType == nil || deviceIDType.length == 0) {
        [self invokeDidFail:[NSError errorWithDomain:@"Invalid parameters for revoke user consent request" code:0 userInfo:nil]];
    } else if (delegate == nil) {
        [self invokeDidFail:[NSError errorWithDomain:@"Given delegate is nil and required, droping this call" code:0 userInfo:nil]];
    } else {
        self.delegate = delegate;
        NSString *url = [PNLiteConsentEndpoints revokeConsentURLWithDeviceID:deviceID withDeviceIDType:deviceIDType];
        NSDictionary *headerDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"Bearer %@",appToken],@"Authorization", nil];
        PNLiteHttpRequest *request = [[PNLiteHttpRequest alloc] init];
        request.header = headerDictionary;
        [request startWithUrlString:url withMethod:@"DELETE" delegate:self];
    }
}
- (void)invokeDidLoad:(PNLiteUserConsentResponseModel *)model
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(revokeConsentRequestSuccess:)]) {
            [self.delegate revokeConsentRequestSuccess:model];
        }
        self.delegate = nil;
    });
}

- (void)invokeDidFail:(NSError *)error
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if(self.delegate && [self.delegate respondsToSelector:@selector(revokeConsentRequestFail:)]){
            [self.delegate revokeConsentRequestFail:error];
        }
        self.delegate = nil;
    });
}

- (void)processResponseWithData:(NSData *)data
{
    NSError *parseError;
    NSDictionary *jsonDictonary = [NSJSONSerialization JSONObjectWithData:data
                                                                  options:NSJSONReadingMutableContainers
                                                                    error:&parseError];
    if (parseError) {
        [self invokeDidFail:parseError];
    } else {
        PNLiteUserConsentResponseModel *response = [[PNLiteUserConsentResponseModel alloc] initWithDictionary:jsonDictonary];
        if (response == nil) {
            NSError *error = [NSError errorWithDomain:@"Error: Can't parse JSON from server"
                                                 code:0
                                             userInfo:nil];
            [self invokeDidFail:error];
        } else {
            [self invokeDidLoad:response];
        }
    }
}

#pragma mark PNLiteHttpRequestDelegate

- (void)request:(PNLiteHttpRequest *)request didFinishWithData:(NSData *)data statusCode:(NSInteger)statusCode
{
    [self processResponseWithData:data];
}

-(void)request:(PNLiteHttpRequest *)request didFailWithError:(NSError *)error
{
    [self invokeDidFail:error];
}

@end
