//
//  JKGroupModel.h
//  QQList
//
//  Created by 黄斌超 on 15/9/6.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JKFriendsModel;
@interface JKGroupModel : NSObject
@property (nonatomic ,copy  ) NSString       *name;
@property (nonatomic ,copy  ) NSString       *online;
@property (nonatomic ,strong) NSArray        *friends;
@property (nonatomic ,strong) JKFriendsModel *friendModel;
@property (nonatomic ,assign) BOOL           isOpen;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)GroupWithDict:(NSDictionary *)dict;
@end
