//
//  BCImage.m
//  IOS事件
//
//  Created by 黄斌超 on 15/9/10.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCImage.h"

@implementation BCImage
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        UIImage *img = [UIImage imageNamed:@"icon"];
        [self setBackgroundColor:[UIColor colorWithPatternImage:img]];
    }

    return  self;
}
#pragma mark -UIView的触摸事件
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"UIView start touch...");
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"UIView moving touch...");
    UITouch *touch = [touches anyObject];

    CGPoint current = [touch locationInView:self];
    CGPoint previous = [touch previousLocationInView:self];
    CGPoint center = self.center;

    CGPoint offset = CGPointMake(current.x-previous.x, current.y -previous.y);

    self.center = CGPointMake(center.x+offset.x, center.y+offset.y);
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"UIView end touch...");

}
@end
