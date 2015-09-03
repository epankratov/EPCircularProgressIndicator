//
//  EPCircularProgressIndicator.m
//  EPCircularProgressIndicator
//
//  Created by Eugene Pankratov on 03.09.15.
//  Copyright (c) 2015 pankratov.net.ua. All rights reserved.
//

#import "EPCircularProgressIndicator.h"

@implementation EPCircularProgressIndicator

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInitialization];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self commonInitialization];
    }
    return self;
}

- (void)commonInitialization
{
    [self setOpaque:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.percentage = 0;
    self.strokeWidth = 2;
    self.fillColor = [UIColor darkGrayColor];
    self.fillBackgroundColor = [UIColor clearColor];
}

- (void)setPercentage:(CGFloat)percentage
{
    _percentage = percentage;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGFloat circleRadius = (MIN(self.bounds.size.width, self.bounds.size.height) / 2) - (self.strokeWidth * 2);
    CGPoint circleCenter = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    CGRect circleRect = CGRectMake(circleCenter.x - circleRadius, circleCenter.y - circleRadius, 2 * circleRadius, 2 * circleRadius);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    // Draw circle filled with background color.
    CGContextSetFillColorWithColor(context, self.fillBackgroundColor.CGColor);
    CGContextAddEllipseInRect(context, circleRect);
    CGContextFillPath(context);
    
    // Draw stroked circle to delineate "pie" shape.
    CGContextSetStrokeColorWithColor(context, self.fillColor.CGColor);
    CGContextSetLineWidth(context, self.strokeWidth);
    CGContextAddEllipseInRect(context, circleRect);
    CGContextStrokePath(context);
    
    CGFloat percents = self.percentage / 100;
    CGFloat startAngle = -M_PI_2;
    CGFloat endAngle = startAngle + percents * 2 * M_PI;
    
    CGContextSetFillColorWithColor(context, self.fillColor.CGColor);
    CGContextMoveToPoint(context, circleCenter.x, circleCenter.y);
    CGContextAddLineToPoint(context, CGRectGetMidX(circleRect), CGRectGetMinY(circleRect));
    CGContextAddArc(context, circleCenter.x, circleCenter.y, circleRadius, startAngle, endAngle, NO);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    CGContextRestoreGState(context);
}

@end
