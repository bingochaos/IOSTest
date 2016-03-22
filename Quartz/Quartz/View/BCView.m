//
//  BCView.m
//  Quartz
//
//  Created by 黄斌超 on 15/9/11.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCView.h"

@implementation BCView



- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 20, 50);
    CGPathAddLineToPoint(path, nil, 20, 100);
    CGPathAddLineToPoint(path, nil, 300, 100);

    CGContextAddPath(context, path);

    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1);
    CGContextSetRGBFillColor(context, 0, 1.0, 0, 1);
    CGContextSetLineWidth(context, 2.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);

    CGFloat lengths[2] = {18,9};
    CGContextSetLineDash(context, 0, lengths, 2);
    CGColorRef color = [UIColor grayColor].CGColor;
    CGContextSetShadowWithColor(context, CGSizeMake(2,2), 0.8, color);



    CGContextDrawPath(context, kCGPathFillStroke);

    CGPathRelease(path);
}


@end
