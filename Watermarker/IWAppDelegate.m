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

-(IBAction)setBottom:(id)sender{
    [iWView setBottom:YES];
}

-(IBAction)setTop:(id)sender{
    [iWView setBottom:NO];
}

-(IBAction)setRight:(id)sender{
    [iWView setRight:YES];
}

-(IBAction)setLeft:(id)sender{
    [iWView setRight:NO];
}

-(IBAction)incX:(id)sender{
    if([iWView xOffsetPercent]<50){
        [iWView setXOffsetPercent:[iWView xOffsetPercent]+1];
    }
}

-(void)incY{
    if([iWView yOffsetPercent]<50){
        [iWView setYOffsetPercent:[iWView yOffsetPercent]+1];
    }
}


-(void)decY{
    if([iWView yOffsetPercent]>0){
        [iWView setYOffsetPercent:[iWView yOffsetPercent]-1];
    }
    
}

-(void)decX{
    if([iWView xOffsetPercent]>0){
        [iWView setXOffsetPercent:[iWView xOffsetPercent]-1];
    }
}

-(void)incX{
    if([iWView xOffsetPercent]<50){
        [iWView setXOffsetPercent:[iWView xOffsetPercent]+1];
    }
}

-(IBAction)moveLeft:(id)sender{
    if([iWView right]){
        [self decX];
    }else{
        [self incX];
    }
}

-(IBAction)moveRight:(id)sender{
    if([iWView right]){
        [self incX];
    }else{
        [self decX];
    }
}

-(IBAction)moveUp:(id)sender{
    if([iWView bottom]){
        [self incY];
    }else{
        [self decY];
    }
}

-(IBAction)moveDown:(id)sender{
    if([iWView bottom]){
        [self decY];
    }else{
        [self incY];
    }
}

-(IBAction)incOpacity:(id)sender{
    if([iWView opacityPercent]<100){
        [iWView setOpacityPercent:[iWView opacityPercent]+1];
    }
}

-(IBAction)decOpacity:(id)sender{
    if([iWView opacityPercent]>0){
        [iWView setOpacityPercent:[iWView opacityPercent]-1];
    }
}

-(IBAction)incSize:(id)sender{
    if([iWView widthPercent]<50){
        [iWView setWidthPercent:[iWView widthPercent]+1];
    }
}

-(IBAction)decSize:(id)sender{
    if([iWView widthPercent]>5){
        [iWView setWidthPercent:[iWView widthPercent]-1];
    }
}

- (IBAction)copyToPasteboard:(id)sender {
    NSPasteboard *pasteBoard = [NSPasteboard generalPasteboard];
    [pasteBoard declareTypes:[NSArray arrayWithObjects:NSStringPboardType, nil] owner:nil];
    [pasteBoard setString: [iWView code] forType:NSStringPboardType];
}

-(IBAction)toggleVisibility:(id)sender{
    if([iWView visible]){
        [iWView setVisible:NO];
    }else{
        [iWView setVisible:YES];
    }
}
@end
