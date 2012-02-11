//
//  PeoplePickerViewControllerWrapper.h
//  Keypad
//
//  Created by Craig Patchett on 2/9/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>

@interface PeoplePickerViewControllerWrapper : UIViewController <ABPeoplePickerNavigationControllerDelegate>

@property (nonatomic, retain) ABPeoplePickerNavigationController *ppvc;

@end
