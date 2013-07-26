//
//  IWAppDelegate.m
//  Watermarker
//
//  Created by Iain Wood on 07/07/2013.
//  Copyright (c) 2013 Iain Wood. All rights reserved.
//

#import "IWAppDelegate.h"
#import "IWView.h"
#import "IWPreferencesController.h"

@implementation IWAppDelegate

+(void)initialize{
    NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
    [defaultValues setObject:@"file://~/Documents/watermark" forKey:IWWatermarkURLKey];
    [defaultValues setValue:[NSNumber numberWithInt:50] forKey:IWOpacityKey];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultValues];
    NSLog(@"Registered defaults");
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

-(IBAction)showOpenPanel:(id)sender{
    __block NSOpenPanel *panel=[NSOpenPanel openPanel];
    [panel setAllowedFileTypes:[NSImage imageFileTypes]];
    [panel beginSheetModalForWindow:[iWView window] completionHandler:^ (NSInteger result) {
        if (result == NSOKButton){
            NSImage *image=[[NSImage alloc] initWithContentsOfURL: [panel URL]];
            [iWView setImage:image];
            NSString *watermarkString=[NSString stringWithFormat:@"file://%@",[[panel URL] path]] ;
            NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
            [defaults setValue:watermarkString forKey:IWWatermarkURLKey];

        }
        panel=nil;
    }];
}

-(IBAction)showPreferencesPanel:(id)sender{
    if(!preferencesController){
        preferencesController=[[IWPreferencesController alloc] init];
    }
    //NSLog(@"showing %@",preferencesController);
    [preferencesController showWindow:self];
}

-(IBAction)setPreferences:(id)sender{
    NSLog(@"In setPreferences");
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setInteger:[iWView opacityPercent] forKey:IWOpacityKey];
    [defaults setInteger:[iWView widthPercent] forKey:IWSizeKey];
    [defaults setInteger:[iWView xOffsetPercent] forKey:IWXOffsetKey];
    [defaults setInteger:[iWView yOffsetPercent] forKey:IWYOffsetKey];
}
@end
