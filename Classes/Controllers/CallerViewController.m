//
//  CallerViewController.m
//  Keypad
//
//  Created by Adrian on 10/17/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "CallerViewController.h"
#import "SoundEffect.h"

@implementation CallerViewController

@synthesize phoneNumber;
@synthesize shouldShowNavControllerOnExit;

#pragma mark -
#pragma mark Constructor and destructor

- (id)init 
{
    if (self = [super initWithNibName:@"Caller" bundle:nil]) 
    {
        shouldShowNavControllerOnExit = YES;
        self.hidesBottomBarWhenPushed = YES;
        NSBundle *mainBundle = [NSBundle mainBundle];
        callingSound = [[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"calling" ofType:@"wav"]];
    }
    return self;
}

- (void)dealloc
{
    [callingSound release];
    [phoneNumber release];
    [super dealloc];
}

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
    numberLabel.text = [NSString stringWithFormat:@"Calling\n%@", self.phoneNumber];
}

- (void)viewWillDisappear:(BOOL)animated
{
    if (shouldShowNavControllerOnExit)
    {
        [[self navigationController] setNavigationBarHidden:NO animated:YES];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    [callingSound play];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    return NO;
}

@end
