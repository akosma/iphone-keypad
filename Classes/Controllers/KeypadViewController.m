//
//  KeypadViewController.m
//  Keypad
//
//  Created by Adrian on 10/16/08
//  Converted to iOS 5/XCode 4.2/ARC and streamlined by Craig Patchett on 2/8/12.
//  Copyright (c) 2008 - 2012. All rights reserved.
//

#import "KeypadViewController.h"
#import "CallerViewController.h"
#import "SoundEffect.h"
#import "PhoneNumberFormatter.h"

@interface KeypadViewController()
@property (nonatomic, retain) NSString *phoneNumber;
@property (nonatomic, retain) PhoneNumberFormatter *numberFormatter;
@end

@implementation KeypadViewController

#pragma mark -
#pragma mark Constructors and destructors

@synthesize phoneNumber = _phoneNumber;
@synthesize numberFormatter = _numberFormatter;

- (void)awakeFromNib
{
    numberLabel.text = @"";
    self.phoneNumber = @"";
    self.numberFormatter = [[PhoneNumberFormatter alloc] init];
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    tonesArray = [[NSMutableArray alloc] init];
    [tonesArray addObject:[[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"0" ofType:@"wav"]]];
    [tonesArray addObject:[[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"1" ofType:@"wav"]]];
    [tonesArray addObject:[[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"2" ofType:@"wav"]]];
    [tonesArray addObject:[[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"3" ofType:@"wav"]]];
    [tonesArray addObject:[[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"4" ofType:@"wav"]]];
    [tonesArray addObject:[[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"5" ofType:@"wav"]]];
    [tonesArray addObject:[[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"6" ofType:@"wav"]]];
    [tonesArray addObject:[[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"7" ofType:@"wav"]]];
    [tonesArray addObject:[[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"8" ofType:@"wav"]]];
    [tonesArray addObject:[[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"9" ofType:@"wav"]]];
    [tonesArray addObject:[[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"star" ofType:@"wav"]]];
    [tonesArray addObject:[[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"numeral" ofType:@"wav"]]];
    
    symbolsArray = [NSArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"*", @"#", nil];
    
    // Play a brief sound of silence to get the lazy initialization out of the way (otherwise the first sound 
    // played is delayed by 1/2 second
    
    [[[SoundEffect alloc] initWithContentsOfFile:[mainBundle pathForResource:@"silence" ofType:@"caf"]] play];
}

#pragma mark -
#pragma mark IBAction methods

- (IBAction)typeNumberOrSymbol:(UIButton *)sender
{
    [[tonesArray objectAtIndex:sender.tag] play];
    self.phoneNumber = [self.phoneNumber stringByAppendingString:[symbolsArray objectAtIndex:sender.tag]];
    numberLabel.text = [self.numberFormatter format:self.phoneNumber withLocale:@"US"];
}

- (IBAction)goBack:(id)sender
{
    NSUInteger currentLength = [self.phoneNumber length];
    if (currentLength > 0)
    {
        NSRange range = NSMakeRange(0, currentLength - 1);
        self.phoneNumber = [self.phoneNumber substringWithRange:range];
        numberLabel.text = [self.numberFormatter format:self.phoneNumber withLocale:@"US"];
    }
}

- (IBAction)call:(id)sender
{
    // Initiates a network connection to the backend server,
    // which in turn calls the current device back!
    [self performSegueWithIdentifier:@"KeypadCaller" sender:self];
    numberLabel.text = [self.numberFormatter format:self.phoneNumber withLocale:@"US"];
}

#pragma mark -
#pragma mark Private methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"KeypadCaller"])
        [segue.destinationViewController setPhoneNumber:numberLabel.text];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait ||
            interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

@end
