//
//  CallerViewController.h
//  Keypad
//
//  Created by Adrian on 10/16/08
//  Converted to iOS 5/XCode 4.2/ARC and streamlined by Craig Patchett on 2/8/12.
//  Copyright (c) 2008 - 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SoundEffect;

@interface CallerViewController : UIViewController <UIAlertViewDelegate>
{
@private
    IBOutlet UILabel *numberLabel;
    NSString *phoneNumber;
    SoundEffect *callingSound;
}

@property (nonatomic, retain) NSString *phoneNumber;

- (IBAction)cancel:(id)sender;

@end
