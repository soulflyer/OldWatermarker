//
//  IWPreferencesController.m
//  Watermarker
//
//  Created by Iain Wood on 09/07/2013.
//  Copyright (c) 2013 Iain Wood. All rights reserved.
//

#import "IWPreferencesController.h"

NSString * const IWWatermarkURLKey = @"IWWatermarkURL";
NSString * const IWOpacityKey=@"IWOpacity";
NSString * const IWSizeKey=@"IWSize";
NSString * const IWXOffsetKey=@"IWXOffset";
NSString * const IWYOffsetKey=@"IWYOffset";

@interface IWPreferencesController ()

@end

@implementation IWPreferencesController

+(void)setWatermarkFileURL:(NSURL *)wmURL{
    
}

+(NSURL *)watermarkFileURL{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    return [NSURL URLWithString:[defaults stringForKey:IWWatermarkURLKey]];
}

+(void)setTest:(Boolean)testVal{
    [[ NSUserDefaults standardUserDefaults] setBool:testVal forKey:@"test"];
}

+(Boolean)test{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:@"test"];
}

+(int)preferenceOpacityPercent{
    NSLog(@"In preferenceOpacityPercent getter");
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    return (int)[defaults integerForKey:IWOpacityKey];
}

+(void)setPreferenceOpacityPercent:(int)newOpacity{
    NSLog(@"In setPreferenceOpacityPercent");
    [[NSUserDefaults standardUserDefaults] setInteger:newOpacity forKey:IWOpacityKey];
}

+(int)preferenceSizePercent{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    return (int)[defaults integerForKey:IWSizeKey];
}

+(void)setPreferenceSizePercent:(int)newSize{
    [[NSUserDefaults standardUserDefaults] setInteger:newSize forKey:IWSizeKey];
}


+(int)preferenceXOffsetPercent{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    return (int)[defaults integerForKey:IWXOffsetKey];
}

+(void)setPreferenceXOffsetPercent:(int)newXOffset{
    [[NSUserDefaults standardUserDefaults] setInteger:newXOffset forKey:IWXOffsetKey];
}

+(int)preferenceYOffsetPercent{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    return (int)[defaults integerForKey:IWYOffsetKey];
}

+(void)setPreferenceYOffsetPercent:(int)newYOffset{
    [[NSUserDefaults standardUserDefaults] setInteger:newYOffset forKey:IWYOffsetKey];
}

- (id)init
{
    self = [super initWithWindowNibName:@"Preferences"];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    [checkbox setState:[IWPreferencesController test]];
    [opacity setIntegerValue:[IWPreferencesController preferenceOpacityPercent]];
}

-(IBAction)hideMessage:(id)sender{
    NSLog(@"In hideMessage");
    NSInteger state=[checkbox state];
    [IWPreferencesController setTest:state];
}

@end
