//
//  KCScrollViewController.m
//  UIView
//
//  Created by 黄斌超 on 15/9/7.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "KCScrollViewController.h"

@interface KCScrollViewController ()<UIScrollViewDelegate>

@end

@implementation KCScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加scrollView控件
    //注意UIScreen代表当前屏幕对象，其applicationFrame是当前屏幕内容区域
    _scrollView =[[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    //_scrollView.backgroundColor=[UIColor redColor];
    _scrollView.contentMode=UIViewContentModeScaleToFill;
    [self.view addSubview:_scrollView];


    //添加图片控件
    UIImage *image=[UIImage imageNamed:@"street"];
    _imageView=[[UIImageView alloc]initWithImage:image];
    [_scrollView addSubview:_imageView];


    _scrollView.contentSize=_imageView.frame.size;

    _scrollView.minimumZoomScale =0.6;
    _scrollView.maximumZoomScale = 3;

    _scrollView.delegate = self;
    //_scrollView.contentOffset=CGPointMake(10, 0);
    _scrollView.showsHorizontalScrollIndicator=NO;
    _scrollView.showsVerticalScrollIndicator =NO;


}

#pragma mark -实现缩放
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imageView;
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDecelerating");
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndDecelerating");
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDragging");
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"scrollViewDidEndDragging");
}
-(void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
    NSLog(@"scrollViewWillBeginZooming");
}
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    NSLog(@"scrollViewDidEndZooming");
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    CGSize orginalSize = _scrollView.bounds.size;
    CGSize contentSize = _scrollView.contentSize;
    CGFloat offsetX    = orginalSize.width>contentSize.width?(orginalSize.width - contentSize.width)/2:0;
    CGFloat offsetY    = orginalSize.height>contentSize.height?(orginalSize.height- contentSize.height)/2:0;
    _imageView.center  = CGPointMake(contentSize.width/2+offsetX, contentSize.height/2+offsetY);
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
