//
//  KCTransformViewController.m
//  UIView
//
//  Created by 黄斌超 on 15/9/7.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "KCTransformViewController.h"

//定义rgb颜色
#define NORMAL_COLOR [UIColor colorWithRed:75/255.0 green:160/255.0 blue:253/255.0 alpha:1]
#define HIGHLIGHTED_COLOR [UIColor colorWithRed:197/255.0 green:221/225.0 blue:249/225.0 alpha:1]
//按钮操作
typedef void(^ ButtonHandle)();

@interface KCTransformViewController(){

    UIImageView *_imageView;
    UIButton *_btnRotate;
    UIButton *_btnScale;
    UIButton *_btnTranslate;
}

@end

@implementation KCTransformViewController


- (void)viewDidLoad{
    [super viewDidLoad];

    [self addImageView];
    [self addRotateButton];
    [self addScaleButton];
    [self addTranslate];

}

- (void)addImageView{
    UIImage *image = [UIImage imageNamed:@"icon"];
    _imageView = [[UIImageView alloc]initWithImage:image];
    _imageView.frame = CGRectMake(20, 20, 280, 154);
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
}
- (void)addRotateButton{
    _btnRotate =[self getButton];
    _btnRotate.frame = CGRectMake(20, 400, 280, 30);
    [_btnRotate setTitle:@"旋转" forState:UIControlStateNormal];
    [_btnRotate addTarget:self action:@selector(rotate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnRotate];

}
- (void)addScaleButton{
    _btnScale = [self getButton];
    _btnScale.frame = CGRectMake(20, 450, 280, 30);
    [_btnScale setTitle:@"缩放" forState:UIControlStateNormal];
    [_btnScale addTarget:self action:@selector(scale:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnScale];
}
- (void)addTranslate{
    _btnTranslate = [self getButton];
    _btnTranslate.frame = CGRectMake(20, 500, 280, 30);
    [_btnTranslate setTitle:@"移动" forState:UIControlStateNormal];
    [_btnTranslate addTarget:self action:@selector(translate:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnTranslate];
}

- (void)rotate:(UIButton *)btn{
    [self animation:^{
        CGFloat angele = M_PI_4;
        _imageView.transform = CGAffineTransformRotate(_imageView.transform, angele);
    }];


}
-(void)scale:(UIButton *)btn{
    [UIView animateWithDuration:0.5 animations:^{
        CGFloat scaleOffset = 0.9;
        _imageView.transform = CGAffineTransformScale(_imageView.transform, scaleOffset, scaleOffset);
    }];
}
-(void)translate:(UIButton *)btn{
    [self animation:^{
        CGFloat transformY = 50;
        _imageView.transform= CGAffineTransformTranslate(_imageView.transform, 0, transformY);
    }];
}
-(void)animation:(ButtonHandle)handle{
    //开始动画
    [UIView beginAnimations:@"animation" context:nil];
    //设置动画执行时间
    [UIView setAnimationDuration:0.5];

    handle();

    //执行动画操作
    [UIView commitAnimations];

}
#pragma mark 取得一个按钮,统一按钮样式
-(UIButton *)getButton{
    UIButton *button =[[UIButton alloc]init ];
    //设置正常状态下字体颜色
    [button setTitleColor:NORMAL_COLOR forState:UIControlStateNormal];
    //设置高亮状态下的字体颜色
    [button setTitleColor:HIGHLIGHTED_COLOR forState:UIControlStateHighlighted];
    return button;
}


@end
