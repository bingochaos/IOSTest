//
//  BCLoginViewController.h
//  模态窗口
//
//  Created by 黄斌超 on 15/9/9.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BCMainDelegate;
@interface BCLoginViewController : UIViewController

#pragma mark - 定义代理
@property (nonatomic ,strong) id<BCMainDelegate> delegate;

@end
