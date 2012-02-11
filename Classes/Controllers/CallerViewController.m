//
//  CallerViewController.m
//  Keypad
//
//  Created by Adrian on 10/16/08
//  Converted to iOS 5/XCode 4.2/ARC and streamlined by Craig Patchett on 2/8/12.
//  Copyright (c) 2008 - 2012. All rights reserved.
//

#import "CallerViewController.h"
#import "SoundEffect.h"

@implementation CallerViewController

@synthesize phoneNumber;

#pragma mark -
#pragma mark IBAction methods

- (IBAction)cancel:(id)sender
{
    [[self navigationController] popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark UIAlertViewDelegate methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self cancel:self];
}

#pragma mark -
#pragma mark Private methods

- (void)viewWillAppear:(BOOL)animated
{
    if (!callingSound) {
        NSBundle *mainBundle = [NSBundle mainBundle];
        callingSound = [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"calling" ofType:@"wav"]];
    }
    numberLabel.text = [NSString stringWithFormat:@"Calling\n%@", self.phoneNumber];
}

- (void)viewDidAppear:(BOOL)animated
{
//    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    [callingSound play];
}

- (void)viewWillDisappear:(BOOL)animated
{
//    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    return NO;
}

@end
