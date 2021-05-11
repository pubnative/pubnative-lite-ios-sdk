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

#import "HyBidBannerPresenterFactory.h"
#import "PNLiteAssetGroupType.h"
#import "PNLiteMRAIDBannerPresenter.h"
#import "HyBidVASTAdPresenter.h"

#if __has_include(<HyBid/HyBid-Swift.h>)
    #import <UIKit/UIKit.h>
    #import <HyBid/HyBid-Swift.h>
#else
    #import <UIKit/UIKit.h>
    #import "HyBid-Swift.h"
#endif

@implementation HyBidBannerPresenterFactory

- (HyBidAdPresenter *)adPresenterFromAd:(HyBidAd *)ad {
    switch (ad.adType) {
        case kHyBidAdTypeHTML: {
            PNLiteMRAIDBannerPresenter *mraidBannerPresenter = [[PNLiteMRAIDBannerPresenter alloc] initWithAd:ad];
            return mraidBannerPresenter;
        }
        case kHyBidAdTypeVideo: {
            HyBidVASTAdPresenter *vastAdPresenter = [[HyBidVASTAdPresenter alloc] initWithAd:ad];
            return vastAdPresenter;
        }
        default:
            [HyBidLogger warningLogFromClass:NSStringFromClass([self class]) methodName:NSStringFromSelector(_cmd) message:[NSString stringWithFormat:@"Asset Group %@ is an incompatible Asset Group ID for banner ad format.", ad.assetGroupID]];
            return nil;
    }
}
@end
