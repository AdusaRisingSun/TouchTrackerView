//
//  TouchTracker.m
//  TouchTrackerView
//
//  Created by Adusa on 15/8/25.
//  Copyright (c) 2015年 Adusa. All rights reserved.
//

#import "TouchTracker.h"
#define COOKBOOK_PURPLE_COLOR [UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]
@implementation TouchTracker
{
    NSMutableArray *strokers;
    NSMutableDictionary *touchPaths;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if ( self) {
        self.multipleTouchEnabled=YES;
        strokers=[NSMutableArray array];
        touchPaths=[NSMutableDictionary dictionary];
    }
    return self;
}
-(void)clear
{
    [self setNeedsDisplay];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        NSString *key=[NSString stringWithFormat:@"%d",(int)touch];
        CGPoint pt=[touch locationInView:self];
        UIBezierPath *path=[UIBezierPath bezierPath];
        path.lineWidth=4.0f;
        path.lineCapStyle=kCGLineCapRound;
        [path moveToPoint:pt];
        touchPaths[key]=path;
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        NSString *key=[NSString stringWithFormat:@"%d",(int)touch];
        UIBezierPath *path=[touchPaths objectForKey:key];
        if (!path) {
            break;
        }
        CGPoint pt=[touch locationInView:self];
        [path addLineToPoint:pt];
    }
    [self clear];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        NSString *key=[NSString stringWithFormat:@"%d",(int)touch];
        UIBezierPath *path=[touchPaths objectForKey:key];
        if (path) {
           [strokers addObject:path];
        }
        [touchPaths removeObjectForKey:key];
    }
    [self clear];
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}
-(void)drawRect:(CGRect)rect
{
    [COOKBOOK_PURPLE_COLOR set];
    for (UIBezierPath*path in strokers) {
        [path stroke];
    }
    [[COOKBOOK_PURPLE_COLOR colorWithAlphaComponent:0.5f]set];
    for (UIBezierPath *path in [touchPaths allValues]) {
        [path stroke];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
