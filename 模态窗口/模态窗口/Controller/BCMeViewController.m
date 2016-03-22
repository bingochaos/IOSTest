//
//  BCMeViewController.m
//  模态窗口
//
//  Created by 黄斌超 on 15/9/9.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCMeViewController.h"

@interface BCMeViewController ()
{
    UILabel *_lbUserInfo;
}
@end

@implementation BCMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lbUserInfo = [[ UILabel alloc]initWithFrame:CGRectMake(0, 100, 320, 30)];
    _lbUserInfo.textAlignment = NSTextAlignmentCenter;
    _lbUserInfo.textColor = [UIColor colorWithRed:23/255.0 green:180/255.0 blue:237/255.0 alpha:1];
    [self.view addSubview: _lbUserInfo];

    UIButton *btnClose = [UIButton buttonWithType:UIButtonTypeSystem];
    btnClose.frame = CGRectMake(110, 200, 100, 30);
    [btnClose setTitle:@"关闭" forState:UIControlStateNormal];
    [btnClose addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnClose];

    _lbUserInfo.text = _userInfo;
    // Do any additional setup after loading the view.
}
-(void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
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
