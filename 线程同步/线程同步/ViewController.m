//
//  ViewController.m
//  线程同步
//
//  Created by 黄斌超 on 15/9/18.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "ViewController.h"
#import "BCImageData.h"
#define ROW_COUNT 5
#define COLUMN_COUNT 3
#define ROW_HEIGHT 50
#define ROW_WIDTH ROW_HEIGHT
#define CELL_SPACING 10
#define IMAGE_COUNT 9
@interface ViewController (){
    NSMutableArray *_imageViews;
    NSLock *_lock;
    dispatch_semaphore_t _semaphore;
    NSCondition *_condition;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
}
- (void)layoutUI{
    _imageViews = [NSMutableArray array];
    for(int r = 0; r<ROW_COUNT;r++){
        for(int c=0; c<COLUMN_COUNT;c++){
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(c*ROW_WIDTH+c*CELL_SPACING, r*ROW_HEIGHT+r*CELL_SPACING, ROW_WIDTH, ROW_HEIGHT)];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [self.view addSubview:imageView];
            [_imageViews addObject:imageView];
        }
    }
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(50, 500, 220, 80);
    [button setTitle:@"加载图片" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(loadImageWithMultiThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    UIButton *buttonCreate = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonCreate.frame = CGRectMake(160, 500, 100, 25);
    [buttonCreate setTitle:@"创建图片" forState:UIControlStateNormal];
    [buttonCreate addTarget:self action:@selector(createImageWithMultiThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonCreate];
    _imageNames=[NSMutableArray array];
    _condition = [[NSCondition alloc]init];
    _currentIndex = 0;
//    for (int i=0; i<IMAGE_COUNT; i++) {
//        [_imageNames addObject:[NSString stringWithFormat:@"http://images.cnblogs.com/cnblogs_com/kenshincui/613474/o_%i.jpg",i]];
//    }
   // _lock = [[NSLock alloc]init];
 //   _semaphore = dispatch_semaphore_create(1);
}
- (void)loadImageWithMultiThread{
    int count = ROW_COUNT * COLUMN_COUNT;

    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    for(int i = 0; i<count; ++i){
        dispatch_async(globalQueue, ^{
            [self loadImage:[NSNumber numberWithInt:i]];
        });
    }
}
- (void)createImageWithMultiThread{
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globalQueue, ^{
        [self createImageName];
    });
}
- (void)createImageName{
    [_condition lock];
    if(_imageNames.count>0){
        NSLog(@"createImageName wait,current:%i",_currentIndex);
        [_condition wait];
    }else{
        NSLog(@"createImageName work,current:%i",_currentIndex);
        [_imageNames addObject:[NSString stringWithFormat:@"http://images.cnblogs.com/cnblogs_com/kenshincui/613474/o_%i.jpg",_currentIndex++]];
        [_condition signal];
    }
    [_condition unlock];
}
- (void)updateImageWithData:(NSData *)data andIndex:(int)index{
    UIImage *image = [UIImage imageWithData:data];
    UIImageView *imageView = _imageViews[index];
    imageView.image = image;
}
- (void)loadAnUpdateImageWithIndex:(int)index{
    NSData *data = [self requestData:index];

    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_sync(mainQueue, ^{
        UIImage *image = [UIImage imageWithData:data];
        UIImageView *imageView = _imageViews[index];
        imageView.image = image;
    });
}
- (NSData *)requestData:(int)index{
    NSData *data;
    NSString *name;
    //dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
       if(_imageNames.count>0){
        name = [_imageNames lastObject];
           [NSThread sleepForTimeInterval:0.1f];
        [_imageNames removeObject:name];
    }
   // dispatch_semaphore_signal(_semaphore);
    if(name){
        NSURL *url = [NSURL URLWithString:name];
        data = [NSData dataWithContentsOfURL:url];
    }
    return  data;
}
-(void)loadImage:(NSNumber *)index{
//    int i = [index integerValue];
//    NSData *data = [self requestData:i];
//    dispatch_queue_t mainQueue = dispatch_get_main_queue();
//    dispatch_sync(mainQueue, ^{
//        [self updateImageWithData:data andIndex:i];
//    });
    int i = [index integerValue];

    [_condition lock];
    if(_imageNames.count>0){
        NSLog(@"loadImage work,index is%i",i);
        [self loadAnUpdateImageWithIndex:i];
        [_condition broadcast];
    }else{
        NSLog(@"loadImage wait ,index is %i",i);
        [_condition wait];
        NSLog(@"loadImage resore,index is %i",i);

        [self loadAnUpdateImageWithIndex:i];
    }
    [_condition unlock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
