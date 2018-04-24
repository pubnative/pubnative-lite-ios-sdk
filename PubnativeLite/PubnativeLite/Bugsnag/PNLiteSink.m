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

#import "PNLiteSink.h"
#import "PNLiteCrashTracker.h"
#import "PNLiteCollections.h"
#import "PNLiteNotifier.h"
#import "PNLiteKeys.h"
#import "BSG_KSSystemInfo.h"

// This is private in Bugsnag, but really we want package private so define
// it here.
@interface PNLiteCrashTracker ()
+ (PNLiteNotifier *)notifier;
@end

@implementation PNLiteSink

- (instancetype)initWithApiClient:(PNLiteErrorReportApiClient *)apiClient {
    if (self = [super init]) {
        self.apiClient = apiClient;
    }
    return self;
}

// Entry point called by BSG_KSCrash when a report needs to be sent. Handles
// report filtering based on the configuration options for
// `notifyReleaseStages`. Removes all reports not meeting at least one of the
// following conditions:
// - the report-specific config specifies the `notifyReleaseStages` property and
// it contains the current stage
// - the report-specific and global `notifyReleaseStages` properties are unset
// - the report-specific `notifyReleaseStages` property is unset and the global
// `notifyReleaseStages` property
//   and it contains the current stage
- (void)filterReports:(NSArray *)reports
         onCompletion:(PNLite_KSCrashReportFilterCompletion)onCompletion {
    NSMutableArray *bugsnagReports = [NSMutableArray new];
    PNLiteConfiguration *configuration = [PNLiteCrashTracker configuration];
    
    for (NSDictionary *report in reports) {
        PNLiteCrashReport *bugsnagReport = [[PNLiteCrashReport alloc] initWithKSReport:report];
        BOOL incompleteReport = (![@"standard" isEqualToString:[report valueForKeyPath:@"report.type"]] ||
                                 [[report objectForKey:@"incomplete"] boolValue]);
        
        if (incompleteReport) { // append app/device data as this is unlikely to change between sessions
            NSDictionary *sysInfo = [BSG_KSSystemInfo systemInfo];
            
            // reset any existing data as it will be corrupted/nil
            bugsnagReport.appState = @{};
            bugsnagReport.deviceState = @{};


            NSMutableDictionary *appDict = [NSMutableDictionary new];
            BSGDictInsertIfNotNil(appDict, sysInfo[@BSG_KSSystemField_BundleVersion], @"bundleVersion");
            BSGDictInsertIfNotNil(appDict, sysInfo[@BSG_KSSystemField_BundleID], @"id");
            BSGDictInsertIfNotNil(appDict, configuration.releaseStage, @"releaseStage");
            BSGDictInsertIfNotNil(appDict, sysInfo[@BSG_KSSystemField_SystemName], @"type");
            BSGDictInsertIfNotNil(appDict, sysInfo[@BSG_KSSystemField_BundleShortVersion], @"version");

            NSMutableDictionary *deviceDict = [NSMutableDictionary new];
            BSGDictInsertIfNotNil(deviceDict, sysInfo[@BSG_KSSystemField_Jailbroken], @"jailbroken");
            BSGDictInsertIfNotNil(deviceDict, [[NSLocale currentLocale] localeIdentifier], @"locale");
            BSGDictInsertIfNotNil(deviceDict, sysInfo[@"Apple"], @"manufacturer");
            BSGDictInsertIfNotNil(deviceDict, sysInfo[@BSG_KSSystemField_Machine], @"model");
            BSGDictInsertIfNotNil(deviceDict, sysInfo[@BSG_KSSystemField_Model], @"modelNumber");
            BSGDictInsertIfNotNil(deviceDict, sysInfo[@BSG_KSSystemField_SystemName], @"osName");
            BSGDictInsertIfNotNil(deviceDict, sysInfo[@BSG_KSSystemField_SystemVersion], @"osVersion");

            bugsnagReport.app = appDict;
            bugsnagReport.device = deviceDict;
        }
        
        if (![bugsnagReport shouldBeSent])
            continue;
        BOOL shouldSend = YES;
        for (PNLiteBeforeSendBlock block in configuration.beforeSendBlocks) {
            shouldSend = block(report, bugsnagReport);
            if (!shouldSend)
                break;
        }
        if (shouldSend) {
            [bugsnagReports addObject:bugsnagReport];
        }
    }

    if (bugsnagReports.count == 0) {
        if (onCompletion) {
            onCompletion(bugsnagReports, YES, nil);
        }
        return;
    }

    NSDictionary *reportData = [self getBodyFromReports:bugsnagReports];

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    for (PNLiteBeforeNotifyHook hook in configuration.beforeNotifyHooks) {
        if (reportData) {
            reportData = hook(reports, reportData);
        } else {
            break;
        }
    }
#pragma clang diagnostic pop

    if (reportData == nil) {
        if (onCompletion) {
            onCompletion(@[], YES, nil);
        }
        return;
    }

    [self.apiClient sendData:bugsnagReports
                 withPayload:reportData
                       toURL:configuration.notifyURL
            headers:[configuration errorApiHeaders]
                onCompletion:onCompletion];
}


// Generates the payload for notifying Bugsnag
- (NSDictionary *)getBodyFromReports:(NSArray *)reports {
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    BSGDictSetSafeObject(data, [PNLiteCrashTracker notifier].details, PNLiteKeyNotifier);
    BSGDictSetSafeObject(data, [PNLiteCrashTracker notifier].configuration.apiKey, PNLiteKeyApiKey);
    BSGDictSetSafeObject(data, @"4.0", @"payloadVersion");

    NSMutableArray *formatted =
            [[NSMutableArray alloc] initWithCapacity:[reports count]];

    for (PNLiteCrashReport *report in reports) {
        BSGArrayAddSafeObject(formatted, [report toJson]);
    }

    BSGDictSetSafeObject(data, formatted, PNLiteKeyEvents);
    return data;
}

@end