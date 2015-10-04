//
//  IWView.h
//  Watermarker
//
//  Created by Iain Wood on 07/07/2013.
//  Copyright (c) 2013 Iain Wood. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface IWView : NSView{
    NSImage *image;
    //float opacity;
    int opacityPercent;
    int widthPercent;
    int xOffsetPercent;
    int yOffsetPercent;
    Boolean bottom;
    Boolean right;
    Boolean visible;
    NSURL *watermarkFile;
    //NSString *code;
}

@property (strong) NSString *code;
@property (assign) Boolean bottom;
@property (assign) Boolean right;
@property (assign) Boolean visible;
@property (assign) int xOffsetPercent;
@property (assign) int yOffsetPercent;
@property (assign) int widthPercent;
@property (assign) int opacityPercent;
@property (assign) float opacity;
@property (strong) NSImage *image;
@property (strong) NSURL *watermarkFile;

@end
