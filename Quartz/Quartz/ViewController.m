//
//  ViewController.m
//  Quartz
//
//  Created by 黄斌超 on 15/9/11.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "ViewController.h"
#import "BCView2.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BCView2 *view=[[BCView2 alloc]initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
