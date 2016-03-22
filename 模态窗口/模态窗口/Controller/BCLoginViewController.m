//
//  BCLoginViewController.m
//  模态窗口
//
//  Created by 黄斌超 on 15/9/9.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCLoginViewController.h"
#import "BCMainViewController.h"

@interface BCLoginViewController ()
{
    UITextField *_txtUserName;
    UITextField *_txtPassWord;
}
@end

@implementation BCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addLoginForm];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addLoginForm{
    UILabel *lbUserName = [[UILabel alloc]initWithFrame:CGRectMake(50, 150, 100, 30)];
    lbUserName.text = @"用户名:";
    [self.view addSubview:lbUserName];

    _txtUserName = [[UITextField alloc]initWithFrame:CGRectMake(120, 150, 150, 30)];
    _txtUserName.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_txtUserName];

    UILabel *lbPassWord = [[UILabel alloc]initWithFrame:CGRectMake(50, 200, 100, 30)];
    lbPassWord.text = @"密码:";
    [self.view addSubview:lbPassWord];

    _txtPassWord = [[UITextField alloc]initWithFrame:CGRectMake(120, 200, 150, 30)];
    _txtPassWord.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_txtPassWord];

    UIButton *btnLogin = [UIButton buttonWithType:UIButtonTypeSystem];
    btnLogin.frame = CGRectMake(120, 270, 80, 30);

    [btnLogin setTitle:@"登陆" forState:UIControlStateNormal];
    [self.view addSubview:btnLogin];
    [btnLogin addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];

    UIButton *btnCancel = [UIButton buttonWithType:UIButtonTypeSystem];
    btnCancel.frame = CGRectMake(170, 270, 80, 30);
    [btnCancel setTitle:@"取消" forState:UIControlStateNormal];
    [self.view addSubview:btnCancel];
    [btnCancel addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
}
-(void)login{
    if([_txtUserName.text isEqualToString:@"bingoc"]&&[_txtPassWord.text isEqualToString:@"123"]){
        [self.delegate showUserInfoWithUserName:_txtUserName.text];

        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"系统信息" message:@"用户名或密码错误，请重新输入" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
        [alertView show];
    }
   // [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
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
