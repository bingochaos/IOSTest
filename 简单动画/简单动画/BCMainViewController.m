//
//  BCMainViewController.m
//  简单动画
//
//  Created by 黄斌超 on 15/9/16.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCMainViewController.h"

@interface BCMainViewController (){
    UIImageView *_imageView;
}

@end

@implementation BCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *backgroundImage = [UIImage imageNamed:@"13304908,2560,1600"];
    //self.view.bounds = [UIScreen mainScreen].bounds;
    self.view.backgroundColor = [[UIColor alloc]initWithPatternImage:backgroundImage];

    _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"球"]];
    _imageView.center = CGPointMake(150, 50);
    [self.view addSubview:_imageView];
    // Do any additional setup after loading the view.

}
- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context)
     {
         if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact){

         }
         else{

         }
         [self.view setNeedsLayout];
     }completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint location = [touch locationInView:self.view];
    [UIView animateWithDuration:2.0 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        _imageView.center = location;
    }completion:nil ];
    
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
