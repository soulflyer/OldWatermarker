//
//  IWPreferencesController.h
//  Watermarker
//
//  Created by Iain Wood on 09/07/2013.
//  Copyright (c) 2013 Iain Wood. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString * const IWWatermarkURLKey;
extern NSString * const IWOpacityKey;
extern NSString * const IWSizeKey;
extern NSString * const IWXOffsetKey;
extern NSString * const IWYOffsetKey;

@interface IWPreferencesController : NSWindowController{
    IBOutlet NSButton *checkbox;
    IBOutlet NSSlider *opacity;
}

+(NSURL *)watermarkFileURL;
+(void)setWatermarkFileURL:(NSURL *)wmURL;

+(Boolean)test;
+(void)setTest:(Boolean)testVal;

+(int)preferenceSizePercent;
+(void)setPreferenceSizePercent:(int)newSize;

+(int)preferenceOpacityPercent;
+(void)setPreferenceOpacityPercent:(int)newOpacity;

+(int)preferenceXOffsetPercent;
+(void)setPreferenceXOffsetPercent:(int)newXOffset;

+(int)preferenceYOffsetPercent;
+(void)setPreferenceYOffsetPercent:(int)newYOffset;

-(IBAction)hideMessage:(id)sender;
@end
