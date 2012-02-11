//
//  SoundEffect.m
//  Keypad
//
//  Created by Adrian on 10/16/08
//  Converted to iOS 5/XCode 4.2/ARC and streamlined by Craig Patchett on 2/8/12.
//  Copyright (c) 2008 - 2012. All rights reserved.
//

#import "SoundEffect.h"

@implementation SoundEffect

+ (id)soundEffectWithContentsOfFile:(NSString *)aPath 
{
    if (aPath) 
    {
        return [[SoundEffect alloc] initWithContentsOfFile:aPath];
    }
    return nil;
}

- (id)initWithContentsOfFile:(NSString *)path 
{
    self = [super init];
    
    if (self != nil) 
    {
        NSURL *aFileURL = [NSURL fileURLWithPath:path isDirectory:NO];
        
        if (aFileURL != nil)  
        {
            SystemSoundID aSoundID;
            OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)aFileURL, &aSoundID);
            
            if (error == kAudioServicesNoError) 
            { // success
                _soundID = aSoundID;
            } 
            else 
            {
                NSLog(@"Error (%@) loading sound at path: %@", error, path);
                self = nil;
            }
        } 
        else 
        {
            NSLog(@"NSURL is nil for path: %@", path);
            self = nil;
        }
    }
    return self;
}

-(void)dealloc 
{
    AudioServicesDisposeSystemSoundID(_soundID);
}

-(void)play 
{
    AudioServicesPlaySystemSound(_soundID);
}

@end
