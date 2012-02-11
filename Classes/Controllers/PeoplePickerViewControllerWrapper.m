//
//  PeoplePickerViewControllerWrapper.m
//  Keypad
//
//  Created by Craig Patchett on 2/9/12.
//  Copyright (c) 2012 Yontoo LLC. All rights reserved.
//

#import "PeoplePickerViewControllerWrapper.h"
#import "CallerViewController.h"

@interface PeoplePickerViewControllerWrapper()
@property (nonatomic, retain) NSString *phoneNumber;
@end

NSString *retrieveValueForPropertyAtIndex(ABRecordRef person, ABPropertyID property, ABMultiValueIdentifier index)
{
    ABMultiValueRef items = ABRecordCopyValue(person, property);
    NSString *value = (__bridge NSString *)ABMultiValueCopyValueAtIndex(items, index);
    CFRelease(items);
    return value;
}

@implementation PeoplePickerViewControllerWrapper

@synthesize ppvc = _ppvc;  // This is the object being proxyed
@synthesize phoneNumber = _phoneNumber;

- (void)awakeFromNib
{
    self.ppvc = [[ABPeoplePickerNavigationController alloc] init ];
    self.ppvc.peoplePickerDelegate = self;
    self.ppvc.displayedProperties = [NSArray arrayWithObject:[NSNumber numberWithInt:kABPersonPhoneProperty]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ContactsCaller"]) {
        CallerViewController *callerViewController = (CallerViewController *)segue.destinationViewController;
        [callerViewController setPhoneNumber:self.phoneNumber];
    }
}

#pragma mark - View lifecycle

-(UIView *)view{
    return self.ppvc.view;
}

- (void)loadView
{
    [super loadView];
    [self.ppvc loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.ppvc viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
    [self.ppvc viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated 
{
    [super viewDidAppear:animated];
    [self.ppvc viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.ppvc viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated 
{
    [super viewDidDisappear:animated];
    [self.ppvc viewDidDisappear:animated];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self.ppvc viewDidUnload];
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
        self.phoneNumber = phoneNumber;
        [self performSegueWithIdentifier:@"ContactsCaller" sender:self];
        return NO;
    }
    return YES;
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)picker
{
}

@end