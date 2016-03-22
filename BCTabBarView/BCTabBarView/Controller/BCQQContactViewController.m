//
//  BCQQContactViewController.m
//  BCTabBarView
//
//  Created by 黄斌超 on 15/9/9.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCQQContactViewController.h"
#import "BCPublicAccountViewController.h"
@interface BCQQContactViewController ()

@end

@implementation BCQQContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"childViewControllers:%@",self.navigationController.childViewControllers);
    [self setTitle:@"QQ Contact"];

    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithTitle:@"QQ" style:UIBarButtonItemStyleDone target:self action:nil];

    self.navigationItem.backBarButtonItem = back;

    self.navigationItem.rightBarButtonItem  = [[UIBarButtonItem alloc]initWithTitle:@"Public Account" style:UIBarButtonItemStyleDone target:self action:@selector(gotoNextView)];

    // Do any additional setup after loading the view.
}
-(void)gotoNextView{
    BCPublicAccountViewController *publicAccountController = [[BCPublicAccountViewController alloc]init];
    [self.navigationController pushViewController:publicAccountController animated:YES];
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
