//
//  BCMainViewController.h
//  模态窗口
//
//  Created by 黄斌超 on 15/9/9.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - 定义协议用于参数传递
@protocol BCMainDelegate
-(void)showUserInfoWithUserName:(NSString *)userName;
@end
@interface BCMainViewController : UIViewController


@end
