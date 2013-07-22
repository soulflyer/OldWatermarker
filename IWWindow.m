//
//  IWWindow.m
//  Watermarker
//
//  Created by Iain Wood on 07/07/2013.
//  Copyright (c) 2013 Iain Wood. All rights reserved.
//

#import "IWWindow.h"

@implementation IWWindow

- (id)initWithContentRect:(NSRect)contentRect
                styleMask:(NSUInteger)aStyle
                  backing:(NSBackingStoreType)bufferingType
                    defer:(BOOL)flag {
    
    // Using NSBorderlessWindowMask results in a window without a title bar.
    self = [super initWithContentRect:contentRect styleMask:aStyle backing:NSBackingStoreBuffered defer:NO];
    if (self != nil) {
        // Start with no transparency for all drawing into the window
        [self setAlphaValue:1.0];
        // Turn off opacity so that the parts of the window that are not drawn into are transparent.
        [self setOpaque:NO];
    }
    return self;
}

- (BOOL)canBecomeKeyWindow {    
    return YES;
}

@end
