//
//  BCFriendViewController.m
//  BCTabBarView
//
//  Created by 黄斌超 on 15/9/9.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCFriendViewController.h"
#import "BCQQContactViewController.h"

@interface BCFriendViewController ()

@end

@implementation BCFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"childViewControllers:%@",self.navigationController.childViewControllers);

    NSLog(@"%i",self.navigationController == self.parentViewController);

    self.navigationItem.title = @"Friends";

//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonSystemItemAdd target:nil action:nil];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ff_IconAdd"] style:UIBarButtonItemStyleDone target:self action:@selector(addFriends)];
    // Do any additional setup after loading the view.
}
-(void)addFriends{
    BCQQContactViewController *qqContactController = [[BCQQContactViewController alloc]init];
    [self.navigationController pushViewController:qqContactController animated:YES];
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
