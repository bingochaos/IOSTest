//
//  JKAppView.h
//  应用管理
//
//  Created by 黄斌超 on 15/9/4.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKAppInfo.h"


@class JKAppInfo;

@protocol JKAppViewDelegate  <NSObject>
@optional
- (void)downloadClickWithBtn:(UIButton *)btn;

@end
@interface JKAppView : UIView

@property (nonatomic ,strong)JKAppInfo *appInfo;

+ (instancetype)appView;
@property (nonatomic ,weak) id<JKAppViewDelegate> delegate;

@end
