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
        if(right){
            imageRect.origin.x=[self frame].size.width*(1-(xOffsetPercent+widthPercent)/100.0);
        }else{
            imageRect.origin.x=[self frame].size.width * xOffsetPercent/100.0;
        }
        if(bottom){
            imageRect.origin.y=[self frame].size.height * yOffsetPercent / 100.0;
        }else{
            imageRect.origin.y=[self frame].size.height*(1-(yOffsetPercent)/100.0)-[self frame].size.width*(image.size.height/image.size.width)*widthPercent/100.0;
        }
        
        
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
    [self setCode:@""];
    [self setNeedsDisplay:YES];
}

-(int)opacityPercent{
    return opacityPercent;
}

-(void)setOpacityPercent:(int)newOpacityPercent{
    opacityPercent=newOpacityPercent;
    [self setCode:@""];
    [self setNeedsDisplay:YES];
}

-(int)widthPercent{
    return widthPercent;
}

-(void)setWidthPercent:(int)newWidthPercent{
    widthPercent=newWidthPercent;
    [self setCode:@""];
    [self setNeedsDisplay:YES];
}

-(int)xOffsetPercent{
    return xOffsetPercent;
}

-(void)setXOffsetPercent:(int)newXOffsetPercent{
    xOffsetPercent=newXOffsetPercent;
    [self setCode:@""];
    [self setNeedsDisplay:YES];
}

-(int)yOffsetPercent{
    return yOffsetPercent;
}

-(void)setYOffsetPercent:(int)newYOffsetPercent{
    yOffsetPercent=newYOffsetPercent;
    [self setCode:@""];
    [self setNeedsDisplay:YES];
}

-(int)corner{
    return corner;
    //return (bottom*2)+right;
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
    [self setCode:@""];
    [self setNeedsDisplay:YES];
}

-(Boolean)bottom{
    return bottom;
}

-(void)setBottom:(Boolean)newBottom{
    bottom=newBottom;
    corner=(bottom*2)+right;
    NSLog(@"corner is: %d",corner);
    [self setCode:@""];
    [self setNeedsDisplay:YES];
}

-(Boolean)right{
    return right;
}

-(void)setRight:(Boolean)newRight{
    right=newRight;
    [self setCode:@""];
    [self setNeedsDisplay:YES];
}

-(void)setWatermarkFile:(NSURL *)newWatermarkFile{
    watermarkFile=newWatermarkFile;    
}

-(NSURL *)watermarkFile{
    return watermarkFile;
}

-(NSString *)code{
    NSString* upDown;
    NSString* leftRight;
    if(bottom){
        upDown=@"B";
    }else{
        upDown=@"T";
    }
    if(right){
        leftRight=@"R";
    }else{
        leftRight=@"L";
    }
    return [NSString stringWithFormat:@"%@%@%dS%dX%dY%d",upDown,leftRight,opacityPercent,widthPercent,xOffsetPercent,yOffsetPercent];
}

-(void)setCode:(NSString *)newCode{
    //code=newCode;
    //code=[NSString stringWithFormat:@"BR%dS%dT%dX%dY%d",corner,widthPercent,opacityPercent,xOffsetPercent,yOffsetPercent];
}

-(Boolean)visible{
    return visible;
}

-(void)setVisible:(Boolean)visibility{
    visible=visibility;
    [self setNeedsDisplay:YES];
}
@end
