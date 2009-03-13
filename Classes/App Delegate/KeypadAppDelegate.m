//
//  KeypadAppDelegate.m
//  Keypad
//
//  Created by Adrian on 10/12/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "KeypadAppDelegate.h"
#import "KeypadViewController.h"
#import "CallerViewController.h"

NSString *retrieveValueForPropertyAtIndex(ABRecordRef person, ABPropertyID property, ABMultiValueIdentifier index)
{
    ABMultiValueRef items = ABRecordCopyValue(person, property);
    NSString *value = (NSString *)ABMultiValueCopyValueAtIndex(items, index);
    CFRelease(items);
    return value;
}

@implementation KeypadAppDelegate

#pragma mark -
#pragma mark Destructor

- (void)dealloc 
{
    [tabBarController release];
    [window release];
    [super dealloc];
}

#pragma mark -
#pragma mark UIApplicationDelegate methods

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{
    KeypadViewController *keypad = [[KeypadViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:keypad];
    [keypad release];
    navController.navigationBarHidden = YES;
    
    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    picker.navigationBar.barStyle = UIBarStyleDefault;
    picker.title = @"Contacts";
    picker.tabBarItem.image = [UIImage imageNamed:@"tab-contacts.png"];
    picker.peoplePickerDelegate = self;

    tabBarController.viewControllers = [[NSArray alloc] initWithObjects:navController, picker, nil];
    [navController release];
    [picker release];
    [window addSubview:tabBarController.view];
}

#pragma mark -
#pragma mark ABPeoplePickerNavigationControllerDelegate methods

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)picker 
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    return YES;
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)picker 
      shouldContinueAfterSelectingPerson:(ABRecordRef)person 
                                property:(ABPropertyID)property 
                              identifier:(ABMultiValueIdentifier)identifier
{
    if (property == kABPersonPhoneProperty)
    {
        NSString *phoneNumber = retrieveValueForPropertyAtIndex(person, property, identifier);
        CallerViewController *caller = [[CallerViewController alloc] init];
        caller.shouldShowNavControllerOnExit = YES;
        caller.phoneNumber = phoneNumber;
        [picker pushViewController:caller animated:YES];
        return NO;
    }
    return YES;
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)picker
{
}

#pragma mark -
#pragma mark UITabBarControllerDelegate methods

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController 
{
}

- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed 
{
}

@end

