//
//  DrawInContextViewController.m
//  CALayerDemo
//
//  Created by 黄斌超 on 15/9/11.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "DrawInContextViewController.h"
#define PHOTO_HEIGHT 150
@interface DrawInContextViewController ()

@end

@implementation DrawInContextViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGPoint postion = CGPointMake(160, 200);
    CGRect bounds = CGRectMake(0, 0, PHOTO_HEIGHT, PHOTO_HEIGHT);
    CGFloat cornerRadius = PHOTO_HEIGHT/2;
    CGFloat borderWidth = 2;

    CALayer *layerShadow = [[CALayer alloc]init];
    layerShadow.bounds = bounds;
    layerShadow.position = postion;
    layerShadow.cornerRadius = cornerRadius;
    layerShadow.shadowColor = [UIColor grayColor].CGColor;
    layerShadow.shadowOffset = CGSizeMake(2, 1);
    layerShadow.shadowOpacity= 1;
    layerShadow.borderColor = [UIColor whiteColor].CGColor;
    layerShadow.borderWidth = borderWidth;
    [self.view.layer addSublayer:layerShadow];

    CALayer *layer = [[CALayer alloc]init];
    layer.bounds = bounds;
    layer.cornerRadius = cornerRadius;
    layer.borderWidth = borderWidth;
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.masksToBounds = YES;
    layer.position = postion;
    layer.borderColor = [UIColor whiteColor].CGColor;


    layer.delegate = self;
    [self.view.layer addSublayer:layer];
    [layer setValue:@M_PI forKeyPath:@"transform.rotation.x"];
    [layer setNeedsDisplay];
}
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGContextSaveGState(ctx);
//    CGContextScaleCTM(ctx, 1, -1);
//    CGContextTranslateCTM(ctx, 0, -PHOTO_HEIGHT);
    UIImage *image = [UIImage imageNamed:@"13299861,2560,1600"];

    CGContextDrawImage(ctx, CGRectMake(0, 0, PHOTO_HEIGHT, PHOTO_HEIGHT), image.CGImage);
    CGContextRestoreGState(ctx);
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
