//
//  CallerViewController.h
//  Keypad
//
//  Created by Adrian on 10/17/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SoundEffect;

@interface CallerViewController : UIViewController <UIAlertViewDelegate>
{
@private
    IBOutlet UILabel *numberLabel;
    NSString *phoneNumber;
    BOOL shouldShowNavControllerOnExit;
    SoundEffect *callingSound;
}

@property (nonatomic, retain) NSString *phoneNumber;
@property (nonatomic) BOOL shouldShowNavControllerOnExit;

- (IBAction)cancel:(id)sender;

@end
