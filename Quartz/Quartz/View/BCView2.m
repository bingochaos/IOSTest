//
//  BCView2.m
//  Quartz
//
//  Created by 黄斌超 on 15/9/11.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCView2.h"

@implementation BCView2


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawImage2:context];
}
-(void)drawImage:(CGContextRef)context{
    CGContextSaveGState(context);

    CGContextTranslateCTM(context, 100, 0);

    CGContextScaleCTM(context, 0.8, 0.8);

    CGContextRotateCTM(context, M_PI_4/4);

    UIImage *image = [UIImage imageNamed:@"street"];
    [image drawInRect:CGRectMake(0, 50, 240, 300)];

    CGContextRestoreGState(context);
}
-(void)drawImage2:(CGContextRef)context{
    UIImage *image=[UIImage imageNamed:@"street"];

    CGSize size = [UIScreen mainScreen].bounds.size;
    CGContextSaveGState(context);

    CGFloat height = 450,y=50;

    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, 0, -(size.height-(size.height-2*y-height)));
    CGRect rect = CGRectMake(10, y, 300, height);
    CGContextDrawImage(context, rect, image.CGImage);
    //图像绘制
    //CGRect rect= CGRectMake(10, 50, 300, 450);
    //CGContextDrawImage(context, rect, image.CGImage);
}
@end
