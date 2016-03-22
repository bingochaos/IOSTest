//
//  ViewController.m
//  应用管理
//
//  Created by 黄斌超 on 15/9/4.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "ViewController.h"
#import "JKAppInfo.h"
#import "JKAppView.h"


#define kScreenH [UIScreen   mainScreen].bounds.size.height
#define kScreenW [UIScreen   mainScreen].bounds.size.width
#define kAppViewH [JKAppView appView].bounds.size.height
#define kAppViewW [JKAppView appView].bounds.size.width
#define kTotal 3

@interface ViewController ()<JKAppViewDelegate>
@property (nonatomic, strong)NSArray *appViews;
@end

@implementation ViewController

- (NSArray *)appViews
{
    if(!_appViews){

        NSString *path         = [[NSBundle mainBundle] pathForResource:@"app" ofType:@"plist"];
        NSArray *array         = [NSArray arrayWithContentsOfFile:path];

        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for(NSDictionary *dict in array){
            JKAppInfo *appInfo     = [JKAppInfo appInfoWithDict:dict];

            JKAppView *appView     = [JKAppView appView];
            appView.appInfo        = appInfo;
            appView.delegate       = self;
            [arrayM addObject:appView];
        }
        _appViews = [arrayM copy];
    }
    return _appViews;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat margin = (kScreenW - kTotal *kAppViewW)/(kTotal+1);

    for(int i= 0; i<self.appViews.count; i++){
        JKAppView *appView = self.appViews[i];

        int col = i%kTotal;
        int row = i/kTotal;
        CGFloat centerX = (margin +kAppViewW *0.5) +(margin +kAppViewW)*col;
        CGFloat centerY = (margin +kAppViewH *0.5) +(margin +kAppViewH)*row;
        appView.center = CGPointMake(centerX, centerY);
        [self.view addSubview:appView];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - JKAppViewDelegate
-(void)downloadClickWithBtn:(UIButton *)btn
{
    JKAppView *appView = (JKAppView *)btn.superview;
    NSString *appName = appView.appInfo.name;
    UIActivityIndicatorView *loading = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    loading.frame =self.view.bounds;
    //  loading.backgroundColor = [UIColor redColor];

    [loading startAnimating];
    [self.view addSubview:loading];

    UILabel *downloadLabel = [[UILabel alloc] init];
    downloadLabel.frame = CGRectMake(0, kScreenH * 0.5 + 10, kScreenW, 20);

    downloadLabel.textColor = [UIColor whiteColor];
    downloadLabel.textAlignment = NSTextAlignmentCenter;
    downloadLabel.text =
    [NSString stringWithFormat:@"%@正在下载。。。", appName];
    downloadLabel.font = [UIFont systemFontOfSize:15.0];

    downloadLabel.backgroundColor = [UIColor blackColor];
    downloadLabel.alpha = 0.5;

    [loading addSubview:downloadLabel];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [loading stopAnimating];
        UILabel *noteLabel = [[UILabel alloc]init];
        noteLabel.frame = CGRectMake(0, kScreenH * 0.5 + 20, kScreenW, 30);

        noteLabel.textColor = [UIColor whiteColor];
        noteLabel.textAlignment = NSTextAlignmentCenter;
        noteLabel.text= [NSString stringWithFormat:@"%@下载完成。。。", appName];
        noteLabel.font = [UIFont systemFontOfSize:15.0];

        noteLabel .backgroundColor = [UIColor blackColor];
        noteLabel.alpha = 1;

        [loading addSubview:noteLabel];
        [UIView animateWithDuration:2.0 animations:^{
            noteLabel.alpha = 0;
        }completion:^(BOOL finished){
            btn.enabled = NO;
            [btn setTitle:@"已下载" forState:UIControlStateDisabled];

            [noteLabel removeFromSuperview];

        }];
    });
}
@end
