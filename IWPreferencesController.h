//
//  IWPreferencesController.h
//  Watermarker
//
//  Created by Iain Wood on 09/07/2013.
//  Copyright (c) 2013 Iain Wood. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString * const IWWatermarkURLKey;

@interface IWPreferencesController : NSWindowController{
    IBOutlet NSButton *checkbox;
}

+(NSURL *)watermarkFileURL;
+(void)setWatermarkFileURL:(NSURL *)wmURL;

-(IBAction)hideMessage:(id)sender;
@end
