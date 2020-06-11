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

#import "HyBidStatic.h"
#import "HyBidSettings.h"
#import "HyBidUserDataManager.h"

NSString *const HyBidBaseURL = @"https://api.pubnative.net";

@implementation HyBid

+ (void)setCoppa:(BOOL)enabled {
    [HyBidSettings sharedInstance].coppa = enabled;
}

+ (void)setTargeting:(HyBidTargetingModel *)targeting {
    [HyBidSettings sharedInstance].targeting = targeting;
}

+ (void)setTestMode:(BOOL)enabled {
    [HyBidSettings sharedInstance].test = enabled;
}

+ (void)initWithAppToken:(NSString *)appToken completion:(HyBidCompletionBlock)completion {
    [self initWithAppToken:appToken withPartnerKeyword:nil completion:completion];
}

+ (void)initWithAppToken:(NSString *)appToken withPartnerKeyword:(NSString*) partnerKeyword completion:(HyBidCompletionBlock)completion {
    if (!appToken || appToken.length == 0) {
        [HyBidLogger warningLogFromClass:NSStringFromClass([self class]) fromMethod:NSStringFromSelector(_cmd) withMessage:@"App Token is nil or empty and required."];
    } else {
        [HyBidSettings sharedInstance].appToken = appToken;
        [HyBidSettings sharedInstance].partnerKeyword = partnerKeyword;
        [HyBidSettings sharedInstance].apiURL = HyBidBaseURL;
        [HyBidViewabilityManager sharedInstance];
        [[HyBidUserDataManager sharedInstance] createUserDataManagerWithCompletion:^(BOOL success) {
            completion(success);
        }];
    }
}

+ (void)reconfigure:(NSString *)appToken withPartnerKeyword:(NSString*) partnerKeyword completion:(HyBidCompletionBlock)completion {
    [self initWithAppToken:appToken withPartnerKeyword:partnerKeyword completion:completion];
}
@end