//
//  JKAppInfo.h
//  应用管理
//
//  Created by 黄斌超 on 15/9/4.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JKAppInfo : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *icon;
@property (nonatomic, strong,readonly) UIImage *image;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)appInfoWithDict:(NSDictionary *)dict;

@end
