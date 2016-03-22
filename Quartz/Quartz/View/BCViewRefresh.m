//
//  BCViewRefresh.m
//  Quartz
//
//  Created by 黄斌超 on 15/9/11.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCViewRefresh.h"

@implementation BCViewRefresh


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSString *str = _title;
    UIFont *font = [UIFont fontWithName:@"Marker Felt" size:_fontSize];
    UIColor *foreignColor = [UIColor redColor];
    [str drawInRect:CGRectMake(100, 120, 300, 200) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:foreignColor}];
}


@end
