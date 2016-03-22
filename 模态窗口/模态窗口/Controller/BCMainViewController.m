//
//  BCMainViewController.m
//  模态窗口
//
//  Created by 黄斌超 on 15/9/9.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCMainViewController.h"
#import "BCLoginViewController.h"
#import "BCMeViewController.h"
@interface BCMainViewController ()<BCMainDelegate,UIActionSheetDelegate>{
    UILabel *_loginInfo;
    UIBarButtonItem *_loginButton;
    UIBarButtonItem *_meButton;
    BOOL _isLogin;
}
@end

@implementation BCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavigationBar];
    [self addLoginInfo];
    // Do any additional setup after loading the view.
}
#pragma mark - 添加导航栏
- (void)addNavigationBar{
    UINavigationBar *navigationBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44+20)];
    navigationBar.tintColor = [UIColor whiteColor];
    [self.view addSubview:navigationBar];
    UINavigationItem *navigtaionItem = [[UINavigationItem alloc]initWithTitle:@"Web Chat"];
    _loginButton = [[UIBarButtonItem alloc]initWithTitle:@"登陆" style:UIBarButtonItemStyleDone target:self action:@selector(login)];
    navigtaionItem.leftBarButtonItem = _loginButton;
    _meButton = [[UIBarButtonItem alloc]initWithTitle:@"我" style:UIBarButtonItemStyleDone target:self action:@selector(showInfo)];
    _meButton.enabled = NO;
    navigtaionItem.rightBarButtonItem = _meButton   ;
    [navigationBar pushNavigationItem:navigtaionItem animated:YES];
}
#pragma mark - 添加信息显示方法
-(void)addLoginInfo{
    _loginInfo = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 320, 30)];
    _loginInfo.textAlignment = NSTextAlignmentCenter;
    _loginInfo.textColor = [UIColor blackColor];
    [self.view addSubview:_loginInfo];
}
#pragma mark - 登陆方法
-(void)login{
    if(!_isLogin){
        BCLoginViewController *loginController = [[BCLoginViewController alloc]init];
        loginController.delegate = self;
        [self presentViewController:loginController animated:YES completion:nil];
    }else{
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"系统信息" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil];
        [actionSheet showInView:self.view];
    }
//    BCLoginViewController *loginViewController = [[BCLoginViewController alloc]init];
//
//    [self presentViewController:loginViewController animated:YES completion:nil];

}
-(void)showInfo{
    if(_isLogin){
        BCMeViewController *meController = [[BCMeViewController alloc]init];
        meController.userInfo = _loginInfo.text;
        [self presentViewController:meController animated:YES completion:nil];
    }

}
-(void)showUserInfoWithUserName:(NSString *)userName{

    _isLogin = YES;
    _loginInfo.text = [NSString stringWithFormat:@"Hello,%@!",userName];

    _loginButton.title = @"注销";
    _meButton.enabled = YES;
    
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 0){
        _isLogin = NO;
        _loginButton.title = @"登陆";
        _loginInfo.text = @""   ;
        _meButton.enabled = NO;
    }
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
