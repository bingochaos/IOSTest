//
//  JKFriendsModel.m
//  QQList
//
//  Created by 黄斌超 on 15/9/6.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "JKFriendsModel.h"

@implementation JKFriendsModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return  self;
}
+ (instancetype)friendWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
