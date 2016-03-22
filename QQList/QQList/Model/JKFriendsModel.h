//
//  JKFriendsModel.h
//  QQList
//
//  Created by 黄斌超 on 15/9/6.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKFriendsModel : NSObject
@property (nonatomic ,copy  ) NSString     *icon;
@property (nonatomic ,copy  ) NSString     *name;
@property (nonatomic ,copy  ) NSString     *intro;
@property (nonatomic ,assign) BOOL         isVip;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendWithDict:(NSDictionary *)dict;


@end
