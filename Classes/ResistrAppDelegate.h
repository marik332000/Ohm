//
//  ResistrAppDelegate.h
//  Resistr
//
//  Created by Christine Corbett Moran on 6/28/10.
//  Copyright Cannytrophic LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ResistrViewController;

@interface ResistrAppDelegate : NSObject <UIPickerViewDataSource, UIPickerViewDelegate> {
	UIWindow *window;
  ResistrViewController *viewController;
	IBOutlet UIPickerView *pickerView;
}

// implementing the UIPickerView protocol
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView;
- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view;
- (NSNumber*) calculateResistance:(UIPickerView *)thePickerView;
- (NSString*) calculateUnits:(UIPickerView *)thePickerView;
@property (nonatomic,retain) UIPickerView *pickerView;
@property (nonatomic,retain) IBOutlet UITextField *computedResistance;
@property (nonatomic,retain) IBOutlet UITextField *resistanceUnits;
@property (nonatomic,retain) IBOutlet UITextField *toleranceValue;
@property (nonatomic,retain) IBOutlet UIWindow *window;
@property (nonatomic,retain) IBOutlet ResistrViewController *viewController;

@end

