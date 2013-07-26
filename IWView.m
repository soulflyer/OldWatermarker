//
//  IWView.m
//  Watermarker
//
//  Created by Iain Wood on 07/07/2013.
//  Copyright (c) 2013 Iain Wood. All rights reserved.
//

#import "IWView.h"
#import "IWPreferencesController.h"

@implementation IWView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        image=[[NSImage alloc] initWithContentsOfURL:[NSURL URLWithString:[defaults valueForKey:IWWatermarkURLKey]]];
        widthPercent=(int)[defaults integerForKey:IWSizeKey];
        //opacity=0.5;
        opacityPercent=(int)[defaults integerForKey:IWOpacityKey];
        xOffsetPercent=(int)[defaults integerForKey:IWXOffsetKey];
        yOffsetPercent=(int)[defaults integerForKey:IWYOffsetKey];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor clearColor] set];
    NSRectFill([self frame]);
    [[self window] setHasShadow:NO];
    if(image){
        NSRect imageRect;
        imageRect.origin=NSZeroPoint;
        imageRect.origin.x=[self frame].size.width * xOffsetPercent / 100.0;
        imageRect.origin.y=[self frame].size.height * yOffsetPercent / 100.0;
        //imageRect.origin.x=100;
        //imageRect.origin.y=100;
        imageRect.size.width=[self frame].size.width * widthPercent / 100.0;
        imageRect.size.height=imageRect.size.width * image.size.height / image.size.width;
        NSRect drawingRect=imageRect;
        [image drawInRect:drawingRect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:opacityPercent/100.0];
    }
}


-(NSImage *)image{
    return image;
}

-(void)setImage:(NSImage *)newImage{
    image=newImage;
    [self setNeedsDisplay:YES];
}

-(float)opacity{
    return opacity;
}

-(void)setOpacity:(float)newOpacity{
    opacity=newOpacity;
    [self setNeedsDisplay:YES];
}

-(int)opacityPercent{
    return opacityPercent;
}

-(void)setOpacityPercent:(int)newOpacityPercent{
    opacityPercent=newOpacityPercent;
    [self setNeedsDisplay:YES];
}

-(int)widthPercent{
    return widthPercent;
}

-(void)setWidthPercent:(int)newWidthPercent{
    widthPercent=newWidthPercent;
    [self setNeedsDisplay:YES];
}

-(int)xOffsetPercent{
    return xOffsetPercent;
}

-(void)setXOffsetPercent:(int)newXOffsetPercent{
    xOffsetPercent=newXOffsetPercent;
    [self setNeedsDisplay:YES];
}

-(int)yOffsetPercent{
    return yOffsetPercent;
}

-(void)setYOffsetPercent:(int)newYOffsetPercent{
    yOffsetPercent=newYOffsetPercent;
    [self setNeedsDisplay:YES];
}

-(int)corner{
    return corner;
}

-(void)setCorner:(int)newCorner{
    corner=newCorner;
    NSLog(@"Corner: %d",corner);
    bottom=YES;
    if(newCorner<2){
        bottom=NO;
    }
    right=YES;
    if(newCorner==0||newCorner==2){
        right=NO;
    }
    [self setNeedsDisplay:YES];
}

-(Boolean)bottom{
    return bottom;
}

-(void)setBottom:(Boolean)newBottom{
    bottom=newBottom;
    [self setNeedsDisplay:YES];
}

-(Boolean)right{
    return right;
}

-(void)setRight:(Boolean)newRight{
    right=newRight;
    [self setNeedsDisplay:YES];
}

-(void)setWatermarkFile:(NSURL *)newWatermarkFile{
    watermarkFile=newWatermarkFile;    
}

-(NSURL *)watermarkFile{
    return watermarkFile;
}



@end
