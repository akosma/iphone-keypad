//
//  KeypadViewController.m
//  Keypad
//
//  Created by Adrian on 10/16/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "KeypadViewController.h"
#import "CallerViewController.h"
#import "SoundEffect.h"

@implementation KeypadViewController

#pragma mark -
#pragma mark Constructors and destructors

- (id)init
{
    if (self = [super initWithNibName:@"Keypad" bundle:nil]) 
    {
        self.title = @"Keypad";
        self.tabBarItem.image = [UIImage imageNamed:@"tab-keypad.png"];
        numberLabel.text = @"";
        NSBundle *mainBundle = [NSBundle mainBundle];
        tone0 = [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"0" ofType:@"wav"]];
        tone1 = [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"1" ofType:@"wav"]];
        tone2 = [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"2" ofType:@"wav"]];
        tone3 = [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"3" ofType:@"wav"]];
        tone4 = [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"4" ofType:@"wav"]];
        tone5 = [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"5" ofType:@"wav"]];
        tone6 = [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"6" ofType:@"wav"]];
        tone7 = [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"7" ofType:@"wav"]];
        tone8 = [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"8" ofType:@"wav"]];
        tone9 = [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"9" ofType:@"wav"]];
        toneStar = [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"star" ofType:@"wav"]];
        toneNumeral = [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"numeral" ofType:@"wav"]];
    }
    return self;
}

- (void)dealloc 
{
    [tone0 release];
    [tone1 release];
    [tone2 release];
    [tone3 release];
    [tone4 release];
    [tone5 release];
    [tone6 release];
    [tone7 release];
    [tone8 release];
    [tone9 release];
    [toneStar release];
    [toneNumeral release];
    [super dealloc];
}

#pragma mark -
#pragma mark IBAction methods

- (IBAction)typeNumberOrSymbol:(id)sender
{
    NSString *symbol = @"";
    if (sender == button0)
    {
        [tone0 play];
        symbol = @"0";
    }
    else if (sender == button1)
    {
        [tone1 play];
        symbol = @"1";
    }
    else if (sender == button2)
    {
        [tone2 play];
        symbol = @"2";
    }
    else if (sender == button3)
    {
        [tone3 play];
        symbol = @"3";
    }
    else if (sender == button4)
    {
        [tone4 play];
        symbol = @"4";
    }
    else if (sender == button5)
    {
        [tone5 play];
        symbol = @"5";
    }
    else if (sender == button6)
    {
        [tone6 play];
        symbol = @"6";
    }
    else if (sender == button7)
    {
        [tone7 play];
        symbol = @"7";
    }
    else if (sender == button8)
    {
        [tone8 play];
        symbol = @"8";
    }
    else if (sender == button9)
    {
        [tone9 play];
        symbol = @"9";
    }
    else if (sender == buttonStar)
    {
        [toneStar play];
        symbol = @"*";
    }
    else if (sender == buttonNumeral)
    {
        [toneNumeral play];
        symbol = @"#";
    }
    numberLabel.text = [numberLabel.text stringByAppendingString:symbol];
}

- (IBAction)goBack:(id)sender
{
    NSString *currentValue = numberLabel.text;
    NSUInteger currentLength = [currentValue length];
    if (currentLength > 0)
    {
        NSRange range = NSMakeRange(0, currentLength - 1);
        numberLabel.text = [numberLabel.text substringWithRange:range];
    }
}

- (IBAction)call:(id)sender
{
    // Initiates a network connection to the backend server,
    // which in turn calls the current device back!
    CallerViewController *caller = [[CallerViewController alloc] init];
    caller.shouldShowNavControllerOnExit = NO;
    caller.phoneNumber = numberLabel.text;
    [self.navigationController pushViewController:caller animated:YES];
}

#pragma mark -
#pragma mark Private methods

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    return NO;
}

@end
