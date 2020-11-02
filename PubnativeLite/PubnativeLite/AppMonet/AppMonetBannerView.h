////
//  Copyright © 2020 PubNative. All rights reserved.
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

#import "AppMonetBannerView.h"
#import <UIKit/UIKit.h>
#import "AMBannerAdDelegate.h"
#import "AppMonetBid.h"
#import "HyBidAdView.h"

extern CGSize const MONET_BANNER_SIZE;
extern CGSize const MONET_MEDIUM_RECT_SIZE;

@protocol AMOBannerManagerDelegate;
@protocol AMOAdViewDelegate;
@protocol AMBannerAdDelegate;

@interface AppMonetBannerView: HyBidAdView
@property(nonatomic, strong) NSString *adUnitId;
@property(nonatomic, weak) id <AMBannerAdDelegate> bannerDelegate;

- (id)initWithAdUnitId:(NSString *)adUnitId size:(CGSize)size;

- (void)loadAd;

- (void)loadCustomEventAdapter:(NSDictionary *)localExtras withHandler:(void (^)(AppMonetBid *bid))handler;

- (void)onBannerFailed:(NSError *)error;

- (void)registerClick;

- (void)adLoaded;

- (void)setAdView:(UIView *)bannerView;

- (void)requestAds:(void (^)(AppMonetBid *bid))handler;

- (void)render:(AppMonetBid *)bid;

@end
