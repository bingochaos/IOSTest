//
//  ViewController.m
//  WebView
//
//  Created by 黄斌超 on 11/4/15.
//  Copyright © 2015 bingoc. All rights reserved.
//

#import "ViewController.h"
#define FILEPROTOCOL @"file://"

@interface ViewController ()<UISearchBarDelegate,UIWebViewDelegate>{
    UIWebView *_webView;
    UIToolbar *_toolBar;
    UISearchBar *_searchBar;
    UIBarButtonItem *_barButtonBack;
    UIBarButtonItem *_barButtonForward;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma  mark - 界面布局
- (void)layoutUI{
    //地址栏
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 20, 320, 44)];
    _searchBar.delegate = self;
    [self.view addSubview:_searchBar];

    //webview
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, 320, 460)];
    _webView.dataDetectorTypes = UIDataDetectorTypeAll;
    _webView.delegate = self;
    [self.view addSubview:_webView];

    //工具栏
    _toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 524, 320, 44)];
    UIButton *btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    btnBack.bounds = CGRectMake(0, 0, 32, 32);
    [btnBack addTarget:self action:@selector(webViewBack) forControlEvents:UIControlEventTouchUpInside];
    _barButtonBack = [[UIBarButtonItem alloc]initWithCustomView:btnBack];
    _barButtonBack.enabled = NO;

    UIBarButtonItem *btnSpacing = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

    UIButton *btnForward = [UIButton buttonWithType:UIButtonTypeCustom];
    btnForward.bounds = CGRectMake(0, 0, 32, 32);
    [btnForward addTarget:self action:@selector(webViewForward) forControlEvents:UIControlEventTouchUpInside];
    _barButtonForward = [[UIBarButtonItem alloc]initWithCustomView:btnForward];
    _barButtonForward.enabled = NO;

    _toolBar.items = @[_barButtonBack,btnSpacing,_barButtonForward];
    [self.view addSubview:_toolBar];

    

}

#pragma mark - 设置按钮状态
- (void)setBarButtonStatus{
    if(_webView.canGoBack){
        _barButtonBack.enabled = YES;
    }else{
        _barButtonBack.enabled = NO;
    }
    if(_webView.canGoForward)
        _barButtonForward.enabled = YES;
    else
        _barButtonForward.enabled = NO;
}
#pragma mark - 前进后退
- (void)webViewBack{
    [_webView goBack];
}
- (void)webViewForward{
    [_webView goForward];
}

#pragma mark - 浏览器请求
- (void)request:(NSString *)urlStr{
    NSURL *url;

    if([urlStr hasPrefix:FILEPROTOCOL]){
        NSRange range  = [urlStr rangeOfString:FILEPROTOCOL];
        NSString *fileName = [urlStr substringFromIndex:range.length];
        url = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
    }
    else if (urlStr.length>0){
        if([urlStr hasPrefix:@"http"]){
            url = [NSURL URLWithString:urlStr];
        }else{
            urlStr = [NSString stringWithFormat:@"http://m.bing.com/drstvh?q=%@",urlStr];
        }
        urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        url = [NSURL URLWithString:urlStr];
    }
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [_webView loadRequest:request];
}

#pragma mark - WebView 代理
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible= true;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = false;

    [self setBarButtonStatus];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"error detail:%@",error.localizedDescription);
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"系统提示" message:@"网络连接发生错误" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
    [alert show];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self request:_searchBar.text];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
