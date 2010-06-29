//
//  ResistrAppDelegate.m
//  Resistr
//
//  Created by Christine Corbett Moran on 6/28/10.
//  Copyright Cannytrophic LLC 2010. All rights reserved.
//

#import "ResistrAppDelegate.h"
#import "ResistrViewController.h"

@implementation ResistrAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize pickerView;
@synthesize computedResistance;
@synthesize resistanceUnits;
@synthesize toleranceValue;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

    // Add the view controller's view to the window and display.
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}

// These are all implementing the UIPickerView protocol
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
	
	return 4;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
	if(component == 0){
		return 10;
	}
	else if(component==1){
		return 9;
	}
	else if(component==2){
		return 9;
	}
	else if (component==3) {
		return 4;
	}
	else {
		return 0;
	}

}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return @"";
}

- (NSNumber*) calculateResistance:(UIPickerView *)thePickerView {
	float resistance = 0.0;
	resistance += [thePickerView selectedRowInComponent:0]*10;
	resistance += [thePickerView selectedRowInComponent:1];
	resistance *= pow(10.0,[thePickerView selectedRowInComponent:2]);
	NSLog(@"resistance %f",resistance);
	return [NSNumber numberWithFloat:resistance];
}

- (NSString*) calculateUnits:(UIPickerView *)thePickerView {
	// TODO: implement later
	return @"";
	
}

- (NSString*) calculateTolerance:(UIPickerView *)thePickerView {
	// TODO: implement later
	int selectedTolerance=[thePickerView selectedRowInComponent:3];
	if(selectedTolerance == 0){
		return @"2";
	}
	else if(selectedTolerance == 1){
		return @"5";
	}
	else if(selectedTolerance == 2) {
		return @"10";
	}
	else {
		return @"20";
	}
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	NSLog(@"selected");
	self.computedResistance.text = [NSString stringWithFormat:@"%@",[self calculateResistance:thePickerView]];
	self.resistanceUnits.text = [NSString stringWithFormat:@"%@Ω",[self calculateUnits:thePickerView]];
	self.toleranceValue.text = [NSString stringWithFormat:@"±%@%%",[self calculateTolerance:thePickerView]];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
	
	CGRect imageFrame = CGRectMake(0.0, 0.0, 30, 30);
	UIImageView* label = [[UIImageView alloc] initWithFrame:imageFrame];
	NSArray* colorLabels = [NSArray arrayWithObjects:[UIColor blackColor],[UIColor brownColor],[UIColor redColor],
													[UIColor orangeColor],[UIColor yellowColor],[UIColor greenColor],[UIColor blueColor],
													[UIColor purpleColor],[UIColor lightGrayColor],[UIColor whiteColor],nil];
	NSArray* toleranceLabels = [NSArray arrayWithObjects:[UIColor redColor],[UIColor yellowColor],[UIColor lightGrayColor],[UIColor clearColor],nil];
	if(component < 3){
		label.backgroundColor = [colorLabels objectAtIndex:row];
	}
	else {
		label.backgroundColor = [toleranceLabels objectAtIndex:row];
	}
	return label;
}



@end
