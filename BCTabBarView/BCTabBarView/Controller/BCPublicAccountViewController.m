//
//  KCPublicAccountViewController.m
//  BCTabBarView
//
//  Created by 黄斌超 on 15/9/9.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCPublicAccountViewController.h"

@interface BCPublicAccountViewController ()

@end

@implementation BCPublicAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"childViewControllers%@",self.navigationController.childViewControllers);
    self.title = @"Public Account";
       self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Add Friends" style:UIBarButtonItemStyleDone target:self action:@selector(gotoAddFriends)];
    // Do any additional setup after loading the view.
}

-(void)gotoAddFriends{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
