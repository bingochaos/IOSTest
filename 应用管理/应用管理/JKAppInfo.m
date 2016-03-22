//
//  JKAppInfo.m
//  应用管理
//
//  Created by 黄斌超 on 15/9/4.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "JKAppInfo.h"

@implementation JKAppInfo

{
    UIImage *_image;
}
- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)appInfoWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (UIImage *)image
{
    if(!_image)
    {
        _image = [UIImage imageNamed:self.icon];
    }
    return  _image;
}


@end
