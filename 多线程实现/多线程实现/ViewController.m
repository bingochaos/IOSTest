//
//  ViewController.m
//  多线程实现
//
//  Created by 黄斌超 on 15/9/17.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "ViewController.h"
#import "BCImageData.h"
#define ROW_COUNT 10
#define COLUMN_COUNT 5
#define ROW_HEIGHT 50
#define ROW_WIDTH ROW_HEIGHT
#define CELL_SPACING 10
@interface ViewController (){
    NSMutableArray *_images;
    NSMutableArray *_imageNames;
    NSMutableArray *_threads;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];

    // Do any additional setup after loading the view, typically from a nib.
}
- (void)layoutUI{
    _images = [NSMutableArray array];
    for(int r = 0;r<ROW_COUNT;r++){
        for(int c = 0;c<COLUMN_COUNT;c++){
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(c*ROW_WIDTH+(c*CELL_SPACING), r*ROW_HEIGHT+(r*CELL_SPACING), ROW_WIDTH, ROW_HEIGHT)];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [self.view addSubview:imageView];
            [_images addObject:imageView];
        }
    }
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(50, 500,100, 25);
    [button setTitle:@"加载图片" forState:UIControlStateNormal];
    //添加方法
    [button addTarget:self action:@selector(loadImageWithGCD) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    UIButton *butttonStop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    butttonStop.frame = CGRectMake(160, 500, 100, 25);
    [butttonStop setTitle:@"停止加载" forState:UIControlStateNormal];
    [butttonStop addTarget:self action:@selector(stopLoadImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butttonStop];
}
- (void)updateImage:(BCImageData *)imageData{
    UIImage *image = [UIImage imageWithData:imageData.imageData];
    UIImageView *imageView = _images[imageData.index];
    imageView.image = image;
}
- (NSData *)requestData:(int )index{
//    if(index != (ROW_COUNT*COLUMN_COUNT-1)){
//        [NSThread sleepForTimeInterval:2.0];
//    }
    NSURL *url = [NSURL URLWithString:@"http://d.lanrentuku.com/down/png/1307/despicable-me2/despicable-me-2-minion-icon-2.png"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    return  data;

}
- (void)loadImage:(NSNumber *)index{
    NSLog(@"current thread:%@",[NSThread currentThread]);
    int i=[index integerValue];

    NSData *data = [self requestData:i];
//    NSThread *currentThread = [NSThread currentThread];
//    if(currentThread.isCancelled){
//        NSLog(@"thread(%@) will be cancelled!",currentThread);
//        [NSThread exit];
//    }
//    BCImageData *imageData = [[BCImageData alloc]init];
//    imageData.index = i;
//    imageData.imageData = data;
//    [self performSelectorOnMainThread:@selector(updateImage:) withObject:imageData waitUntilDone:YES];
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_sync(mainQueue, ^{
        BCImageData *imagedata = [[BCImageData alloc]init];
        imagedata.imageData = data;
        imagedata.index = i;
        [self updateImage:imagedata];
    });
}

- (void)loadImageWithMultiThread{
    int count = ROW_COUNT*COLUMN_COUNT;
    //    _threads = [NSMutableArray arrayWithCapacity:count];
    //NSObject 分类扩展方法
    //    for(int i = 0;i<count;++i){
    //        [self performSelectorInBackground:@selector(loadImage:) withObject:[NSNumber numberWithInt:i]];
    //    }
    //自主建立线程
    //    for(int i = 0;i<count;++i){
    //        NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(loadImage:) object:[NSNumber numberWithInt:i]];
    //        thread.name = [NSString stringWithFormat:@"myThread%i",i];
    //        [_threads addObject:thread];
    //
    //    }
    //    for(int i = 0;i<count;++i){
    //            NSThread *thread = _threads[i];
    //            [thread start];
    //        }
    //NSOperation
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc]init];
    operationQueue.maxConcurrentOperationCount = 5;

    NSBlockOperation *lastBlockOperation = [NSBlockOperation blockOperationWithBlock:^{
        [self loadImage:[NSNumber numberWithInt:(count -1)]];
    }];
    for(int i = 0;i<count-1;++i){
        //    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(loadImage:) object:[NSNumber numberWithInt:i]];
        //        NSOperationQueue *operationQueue = [[NSOperationQueue alloc]init];
        //        [operationQueue addOperation:invocationOperation];
        //1
//        NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
//            [self loadImage:[NSNumber numberWithInt:i]];
//        }];
//        [operationQueue addOperation:blockOperation];
        //2
//        [operationQueue addOperationWithBlock:^{
//            [self loadImage:[NSNumber numberWithInt:i]];
//        }];
        NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
            [self loadImage:[NSNumber numberWithInt:i]];
        }];
        [blockOperation addDependency:lastBlockOperation];
        [operationQueue addOperation:blockOperation];
    }
    [operationQueue addOperation:lastBlockOperation];
}
#pragma mark - GCD实现多线程
-(void)loadImageWithGCD{
    int count = ROW_COUNT * COLUMN_COUNT;

//    dispatch_queue_t serialQueue = dispatch_queue_create("myThreadQueue1", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for(int i = 0 ;i<count;++i) {
        dispatch_async(globalQueue, ^{
            [self loadImage:[NSNumber numberWithInt:i]];
            NSLog(@"thread %i",i);
        });
    }
}
- (void)stopLoadImage{
    for(int i = 0;i<ROW_COUNT*COLUMN_COUNT;i++){
        NSThread *thread = _threads[i];
        if(!thread.isFinished){
            [thread cancel];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
