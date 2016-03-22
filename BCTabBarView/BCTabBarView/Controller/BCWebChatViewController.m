//
//  BCWebChatViewController.m
//  BCTabBarView
//
//  Created by 黄斌超 on 15/9/9.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCWebChatViewController.h"

@interface BCWebChatViewController ()

@end

@implementation BCWebChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.tabBarItem.title = @"WebChat";
    self.tabBarItem.image = [UIImage imageNamed:@"tabbar_mainframe"];
    self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_mainframeHL"];

    self.tabBarItem.badgeValue = @"p";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
