//
//  IWPreferencesController.m
//  Watermarker
//
//  Created by Iain Wood on 09/07/2013.
//  Copyright (c) 2013 Iain Wood. All rights reserved.
//

#import "IWPreferencesController.h"

NSString * const IWWatermarkURLKey = @"IWWatermarkURL";

@interface IWPreferencesController ()

@end

@implementation IWPreferencesController

+(void)setWatermarkFileURL:(NSURL *)wmURL{
    
}

+(NSURL *)watermarkFileURL{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    return [NSURL URLWithString:[defaults stringForKey:IWWatermarkURLKey]];
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
}

-(IBAction)hideMessage:(id)sender{
    NSLog(@"In hideMessage");
}

@end
