//
//  ViewController.m
//  AFNetworking
//
//  Created by 黄斌超 on 11/4/15.
//  Copyright © 2015 bingoc. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "Stripe.h"
@interface ViewController ()<NSURLConnectionDataDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - 网络状态变化提示
- (void)alert:(NSString *)message{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"System Info" message:message delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil , nil];
    [alertView show];
}

#pragma mark - 网络状态监测
- (void)checkNetworkStatus{
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    AFHTTPRequestOperationManager *operationManger = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:url];

    [operationManger.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
                [self alert:@"2G/3G/4G"];
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [self alert:@"WiFi"];
                break;
            case AFNetworkReachabilityStatusNotReachable:
                [self alert:@"Network not found"];
                break;
            case AFNetworkReachabilityStatusUnknown:
                [self alert:@"Unknow"];
            default:
                break;
        }
    }];
    [operationManger.reachabilityManager startMonitoring];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
