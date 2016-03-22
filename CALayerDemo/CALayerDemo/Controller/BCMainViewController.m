//
//  BCMainViewController.m
//  CALayerDemo
//
//  Created by 黄斌超 on 15/9/11.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCMainViewController.h"
#define WIDTH 50
@interface BCMainViewController ()

@end

@implementation BCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawMyLayer];
    // Do any additional setup after loading the view.
}
-(void)drawMyLayer{
    CGSize size = [UIScreen mainScreen].bounds.size;

    CALayer *layer = [[CALayer alloc]init];

    layer.backgroundColor = [UIColor colorWithRed:0 green:146/255.0 blue:1.0 alpha:1.0].CGColor;

    layer.position = CGPointMake(size.width/2, size.height/2);

    layer.bounds = CGRectMake(0, 0, WIDTH, WIDTH);

    layer.cornerRadius= WIDTH/2;
    layer.shadowColor =[UIColor grayColor].CGColor;
    layer.shadowOffset = CGSizeMake(2, 2);
    layer.shadowOpacity= 0.9;

    [self.view.layer addSublayer:layer];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CALayer *layer = self.view.layer.sublayers[0];
    CGFloat width = layer.bounds.size.width;
    if(width == WIDTH){
        width = WIDTH*4;
    }else{
        width = WIDTH;
    }
    layer.bounds = CGRectMake(0, 0, width, width);
    layer.position = [touch locationInView:self.view];
   // layer.cornerRadius = width/2;
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
