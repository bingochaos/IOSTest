//
//  BCTouchEventViewController.m
//  IOS事件
//
//  Created by 黄斌超 on 15/9/10.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCTouchEventViewController.h"
#import "BCImage.h"
@interface BCTouchEventViewController (){
    BCImage *_img;
}

@end

@implementation BCTouchEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _img = [[BCImage alloc]initWithFrame:CGRectMake(50, 50, 150, 169)];
    [self.view addSubview:_img];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"UIView start touch...");
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
   

    NSLog(@"UIViewController moving...");
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"UIView end touch...");

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
