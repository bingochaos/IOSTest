//
//  JKGroupModel.m
//  QQList
//
//  Created by 黄斌超 on 15/9/6.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "JKGroupModel.h"
#import "JKFriendsModel.h"

@implementation JKGroupModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *muArray = [NSMutableArray array];
        for(NSDictionary *dict in self.friends){
            JKFriendsModel *model = [JKFriendsModel friendWithDict:dict];
            [muArray addObject:model];
        }
        self.friends = muArray;
    }
    return self;
}
+ (instancetype)GroupWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
