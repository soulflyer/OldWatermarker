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
    float opacity;
    int opacityPercent;
    int widthPercent;
    int xOffsetPercent;
    int yOffsetPercent;
    int corner;
    NSURL *watermarkFile;
}

@property (assign) int corner;
@property (assign) int xOffsetPercent;
@property (assign) int yOffsetPercent;
@property (assign) int widhPercent;
@property (assign) int opacityPercent;
@property (assign) float opacity;
@property (strong) NSImage *image;
@property (strong) NSURL *watermarkFile;

@end
