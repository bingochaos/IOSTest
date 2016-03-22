//
//  BCContactViewController.m
//  BCTabBarView
//
//  Created by 黄斌超 on 15/9/9.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCContactViewController.h"

@interface BCContactViewController ()

@end

@implementation BCContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];

    self.tabBarItem.title = @"Contact";
    self.tabBarItem.image = [UIImage imageNamed:@"tabbar_contacts"];
    self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_contactsHL"];
    
    // Do any additional setup after loading the view.
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
