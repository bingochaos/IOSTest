//
//  ViewController.m
//  httpTest
//
//  Created by 黄斌超 on 11/3/15.
//  Copyright © 2015 bingoc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate>{
    NSMutableData *_data;
    UITextField *_textField;
    UIButton *_button;
    UIProgressView *_progressView;
    UILabel *_label;
    long long _totalLength;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];

    // Do any additional setup after loading the view, typically from a nib.
}
- (void)layoutUI{
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 50, 300, 25)];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.textColor = [UIColor colorWithRed:0 green:146/255.0 blue:1.0 alpha:1.0];
    _textField.text = @"简约至上:交互设计四策略.epdb";
    [self.view addSubview:_textField];

    //进度条
    _progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(10, 100, 300, 25)];
    [self.view addSubview:_progressView];

    //状态显示
    _label = [[UILabel alloc]initWithFrame:CGRectMake(10, 130, 300, 25)];
    _label.textColor = [UIColor colorWithRed:0 green:146/255.0 blue:1.0 alpha:1.0];
    [self.view addSubview:_label];

    //下载按钮
    _button = [[UIButton alloc]initWithFrame:CGRectMake(10, 500, 300, 25)];
    [_button setTitle:@"下载" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor colorWithRed:0 green:146/255.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(sendRequest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}


#pragma mark 更新进度
- (void)updateProgress{
    if(_data.length == _totalLength){
        _label.text = @"下载完成";
    }else{
        _label.text = @"正在下载中。。。";
        [_progressView setProgress:(float)_data.length/_totalLength];
    }
}

#pragma mark 发送数据请求
- (void)sendRequest{
    NSString *urlStr = [NSString stringWithFormat:@"http://192.168.1.208/FileDownload.aspx?file=%@",_textField.text];

    //url解码使用utf-8,解码使用stringByRemovingPercentEncoding
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    NSURL *url = [NSURL URLWithString:urlStr];

    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15.0f];

    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"receive response.");
    _data  = [[NSMutableData alloc]init];
    _progressView.progress = 0;

    //通过响应头中的content-length取得整个响应的总长度
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSDictionary *httpResponseHeaderFiedls = [httpResponse allHeaderFields];
    _totalLength = [[httpResponseHeaderFiedls objectForKey:@"Content-Length"]longLongValue];

}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"receive data.");
    [_data appendData:data];
    [self updateProgress];

}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"finish");

    NSString *savepath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    savepath = [savepath stringByAppendingPathComponent:_textField.text];
                [_data writeToFile:savepath  atomically:YES];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
            NSLog(@"error%@",error);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
