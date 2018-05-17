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

#import "PNLiteDemoPNLiteSettingsViewController.h"
#import "PNLiteDemoSettings.h"
#import <PubnativeLite/PubnativeLite.h>

@interface PNLiteDemoPNLiteSettingsViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *appTokenTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UIButton *testModeButton;
@property (weak, nonatomic) IBOutlet UIButton *coppaModeButton;
@property (weak, nonatomic) IBOutlet UIButton *notSetButton;
@property (weak, nonatomic) IBOutlet UIButton *maleButton;
@property (weak, nonatomic) IBOutlet UIButton *femaleButton;
@property (nonatomic, assign) BOOL testModeSelected;
@property (nonatomic, assign) BOOL coppaModeSelected;
@property (nonatomic, strong) PNLiteTargetingModel *targetingModel;
@property (nonatomic, strong) NSString *gender;
@end

@implementation PNLiteDemoPNLiteSettingsViewController

-(void)dealloc
{
    self.targetingModel = nil;
    self.gender = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"PubNative Lite Settings";
    self.appTokenTextField.text = [PNLiteDemoSettings sharedInstance].appToken;
    self.testModeSelected = [PNLiteDemoSettings sharedInstance].testMode;
    self.coppaModeSelected = [PNLiteDemoSettings sharedInstance].coppaMode;
    self.targetingModel = [PNLiteDemoSettings sharedInstance].targetingModel;
    self.gender = [PNLiteDemoSettings sharedInstance].targetingModel.gender;
    [self setInitialStateForModeButtons];
    [self setInitialStateForGenderButtons];
    if (self.targetingModel.age.integerValue > 0) {
        self.ageTextField.text = [NSString stringWithFormat:@"%@",[PNLiteDemoSettings sharedInstance].targetingModel.age];
    }
}

- (void)setInitialStateForModeButtons
{
    if (self.testModeSelected) {
        self.testModeButton.selected = YES;
        [self.testModeButton setBackgroundColor:[UIColor colorWithRed:0.33 green:0.59 blue:0.23 alpha:1.00]];
    } else {
        self.testModeButton.selected = NO;
        [self.testModeButton setBackgroundColor:[UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:1.00]];
    }
    
    if (self.coppaModeSelected) {
        self.coppaModeButton.selected = YES;
        [self.coppaModeButton setBackgroundColor:[UIColor colorWithRed:0.33 green:0.59 blue:0.23 alpha:1.00]];
    } else {
        self.coppaModeButton.selected = NO;
        [self.coppaModeButton setBackgroundColor:[UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:1.00]];
    }
}

- (void)setInitialStateForGenderButtons
{
    if ([self.targetingModel.gender isEqualToString:@"m"]) {
        self.notSetButton.selected = NO;
        self.maleButton.selected = YES;
        self.femaleButton.selected = NO;
        [self.notSetButton setBackgroundColor:[UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:1.00]];
        [self.maleButton setBackgroundColor:[UIColor colorWithRed:0.33 green:0.59 blue:0.23 alpha:1.00]];
        [self.femaleButton setBackgroundColor:[UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:1.00]];
    } else if ([self.targetingModel.gender isEqualToString:@"f"]) {
        self.notSetButton.selected = NO;
        self.maleButton.selected = NO;
        self.femaleButton.selected = YES;
        [self.notSetButton setBackgroundColor:[UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:1.00]];
        [self.maleButton setBackgroundColor:[UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:1.00]];
        [self.femaleButton setBackgroundColor:[UIColor colorWithRed:0.33 green:0.59 blue:0.23 alpha:1.00]];
    } else {
        self.notSetButton.selected = YES;
        self.maleButton.selected = NO;
        self.femaleButton.selected = NO;
        [self.notSetButton setBackgroundColor:[UIColor colorWithRed:0.33 green:0.59 blue:0.23 alpha:1.00]];
        [self.maleButton setBackgroundColor:[UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:1.00]];
        [self.femaleButton setBackgroundColor:[UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:1.00]];
    }
}

- (IBAction)handleTap:(UIGestureRecognizer *)recognizer
{
    if (!([self.ageTextField.text length] > 0)) {
        self.ageTextField.text = nil;
        [self.ageTextField resignFirstResponder];
    }
}

- (IBAction)savePNLiteSettingsTouchUpInside:(UIButton *)sender
{
    [PNLiteDemoSettings sharedInstance].appToken = self.appTokenTextField.text;
    [PNLiteDemoSettings sharedInstance].targetingModel = [self configureTargetingModel];
    [PNLiteDemoSettings sharedInstance].testMode = self.testModeSelected;
    [PNLiteDemoSettings sharedInstance].coppaMode = self.coppaModeSelected;
    
    [PubnativeLite initWithAppToken:[PNLiteDemoSettings sharedInstance].appToken];
    [PubnativeLite setTargeting:[PNLiteDemoSettings sharedInstance].targetingModel];
    if (self.testModeSelected) {
        [PubnativeLite setTestMode:YES];
    } else {
        [PubnativeLite setTestMode:NO];
    }
    if (self.coppaModeSelected) {
        [PubnativeLite setCoppa:YES];
    } else {
        [PubnativeLite setCoppa:NO];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (PNLiteTargetingModel *)configureTargetingModel
{
    if (([self.ageTextField.text length] > 0) && (self.ageTextField.text.integerValue > 0)) {
        self.targetingModel.age = [NSNumber numberWithInt:[self.ageTextField.text intValue]];
    }
    self.targetingModel.gender = self.gender;
    self.targetingModel.interests = [[PNLiteDemoSettings sharedInstance].keywords componentsSeparatedByString:@","];
    return self.targetingModel;
}

- (IBAction)notSetTouchUpInside:(UIButton *)sender
{
    self.notSetButton.selected = YES;
    self.maleButton.selected = NO;
    self.femaleButton.selected = NO;
    [self.notSetButton setBackgroundColor:[UIColor colorWithRed:0.33 green:0.59 blue:0.23 alpha:1.00]];
    [self.maleButton setBackgroundColor:[UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:1.00]];
    [self.femaleButton setBackgroundColor:[UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:1.00]];
    self.gender = nil;
}

- (IBAction)maleTouchUpInside:(UIButton *)sender
{
    self.notSetButton.selected = NO;
    self.maleButton.selected = YES;
    self.femaleButton.selected = NO;
    [self.notSetButton setBackgroundColor:[UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:1.00]];
    [self.maleButton setBackgroundColor:[UIColor colorWithRed:0.33 green:0.59 blue:0.23 alpha:1.00]];
    [self.femaleButton setBackgroundColor:[UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:1.00]];
    self.gender = @"m";
}

- (IBAction)femaleTouchUpInside:(UIButton *)sender
{
    self.notSetButton.selected = NO;
    self.maleButton.selected = NO;
    self.femaleButton.selected = YES;
    [self.notSetButton setBackgroundColor:[UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:1.00]];
    [self.maleButton setBackgroundColor:[UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:1.00]];
    [self.femaleButton setBackgroundColor:[UIColor colorWithRed:0.33 green:0.59 blue:0.23 alpha:1.00]];
    self.gender = @"f";
}

- (IBAction)testingModeTouchUpInside:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [sender setBackgroundColor:[UIColor colorWithRed:0.33 green:0.59 blue:0.23 alpha:1.00]];
    } else {
        [sender setBackgroundColor:[UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:1.00]];
    }
    self.testModeSelected = sender.selected;
}

- (IBAction)coppaModeTouchUpInside:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [sender setBackgroundColor:[UIColor colorWithRed:0.33 green:0.59 blue:0.23 alpha:1.00]];
    } else {
        [sender setBackgroundColor:[UIColor colorWithRed:0.69 green:0.69 blue:0.69 alpha:1.00]];
    }
    self.coppaModeSelected = sender.selected;
}

#pragma mark UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField becomeFirstResponder];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField endEditing:YES];
    return YES;
}

@end