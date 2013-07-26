//
//  IWAppDelegate.h
//  Watermarker
//
//  Created by Iain Wood on 07/07/2013.
//  Copyright (c) 2013 Iain Wood. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class IWView;
@class IWPreferencesController;

@interface IWAppDelegate : NSObject <NSApplicationDelegate>{
    IBOutlet IWView *iWView;
    IWPreferencesController *preferencesController;
}

@property (assign) IBOutlet NSWindow *window;
-(IBAction)showOpenPanel:(id)sender;
-(IBAction)showPreferencesPanel:(id)sender;
-(IBAction)setPreferences:(id)sender;
@end
