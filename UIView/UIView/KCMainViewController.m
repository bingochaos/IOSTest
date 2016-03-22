//
//  KCMainViewController.m
//  UIView
//
//  Created by 黄斌超 on 15/9/7.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "KCMainViewController.h"

@interface KCMainViewController ()
{
    UIButton *_btn;
}
@end

@implementation KCMainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _btn = [[UIButton alloc]initWithFrame:CGRectMake(60, 100, 200, 50)];
    _btn.backgroundColor = [UIColor orangeColor];
    [_btn setTitle:@"rotate" forState:UIControlStateNormal];
    _btn.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin;
    [self.view addSubview:_btn];


}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    NSLog(@"%@",NSStringFromCGRect(_btn.frame));
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
