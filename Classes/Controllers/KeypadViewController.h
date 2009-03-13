//
//  KeypadViewController.h
//  Keypad
//
//  Created by Adrian on 10/16/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SoundEffect;

@interface KeypadViewController : UIViewController 
{
@private
    IBOutlet UILabel *numberLabel;
    
    IBOutlet UIButton *button0;
    IBOutlet UIButton *button1;
    IBOutlet UIButton *button2;
    IBOutlet UIButton *button3;
    IBOutlet UIButton *button4;
    IBOutlet UIButton *button5;
    IBOutlet UIButton *button6;
    IBOutlet UIButton *button7;
    IBOutlet UIButton *button8;
    IBOutlet UIButton *button9;

    IBOutlet UIButton *buttonStar;
    IBOutlet UIButton *buttonNumeral;
    
    SoundEffect *tone0;
    SoundEffect *tone1;
    SoundEffect *tone2;
    SoundEffect *tone3;
    SoundEffect *tone4;
    SoundEffect *tone5;
    SoundEffect *tone6;
    SoundEffect *tone7;
    SoundEffect *tone8;
    SoundEffect *tone9;
    SoundEffect *toneStar;
    SoundEffect *toneNumeral;
}

- (IBAction)typeNumberOrSymbol:(id)sender;
- (IBAction)goBack:(id)sender;
- (IBAction)call:(id)sender;

@end
