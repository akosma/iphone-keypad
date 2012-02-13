//
//  KeypadViewController.h
//  Keypad
//
//  Created by Adrian on 10/16/08
//  Converted to iOS 5/XCode 4.2/ARC and streamlined by Craig Patchett on 2/8/12.
//  Copyright (c) 2008 - 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeypadViewController : UIViewController
{
@private
    IBOutlet UILabel *numberLabel;
    
    NSMutableArray *tonesArray;
    NSArray *symbolsArray;
}

- (IBAction)typeNumberOrSymbol:(id)sender;
- (IBAction)goBack:(id)sender;
- (IBAction)call:(id)sender;

@end
