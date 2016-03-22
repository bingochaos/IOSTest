//
//  BCPhotoViewController.m
//  IOS事件
//
//  Created by 黄斌超 on 15/9/10.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCPhotoViewController.h"
#define kImageCount 3
@interface BCPhotoViewController ()<UIGestureRecognizerDelegate>{
    UIImageView *_imageView;
    int _currentIndex;

}

@end

@implementation BCPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initLayout];
    [self addGesture];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initLayout{
    CGSize screenSize = [UIScreen mainScreen].applicationFrame.size;
    CGFloat topPadding = 20;
    CGFloat y = 22+44+topPadding,height=screenSize.height-y-topPadding;

    CGRect imageFrame = CGRectMake(0, y, screenSize.width, height);
    _imageView = [[UIImageView alloc]initWithFrame:imageFrame];
    _imageView.contentMode = UIViewContentModeScaleToFill;
    _imageView.userInteractionEnabled= YES;
    [self.view addSubview:_imageView];

    UIImage *image = [UIImage imageNamed:@"0"];
    _imageView.image = image;
    [self showPhotoName];

}
-(void)addGesture{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImage:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tapGesture];

    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressImage:)];
    longPressGesture.minimumPressDuration= 0.5;
    [_imageView addGestureRecognizer:longPressGesture];

    UIPinchGestureRecognizer *pinGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchImage:)];
    [self.view addGestureRecognizer:pinGesture];

    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotateImage:)];
    [self.view addGestureRecognizer:rotationGesture];

    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panImage:)];
    [_imageView addGestureRecognizer:panGesture];

    UISwipeGestureRecognizer *swipeGestureToRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeImage:)];
    [self.view addGestureRecognizer:swipeGestureToRight];


    UISwipeGestureRecognizer *swipeGestureToLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeImage:)];
    swipeGestureToLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeGestureToLeft];

    [panGesture requireGestureRecognizerToFail:swipeGestureToLeft];
    [panGesture requireGestureRecognizerToFail:swipeGestureToRight];

    [longPressGesture requireGestureRecognizerToFail:panGesture];

    self.view.tag=100;
    _imageView.tag=200;
    UILongPressGestureRecognizer *viewLongPressGesture=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressView:)];
    viewLongPressGesture.delegate=self;
    [self.view addGestureRecognizer:viewLongPressGesture];

}
-(void)showPhotoName{
    NSString *title = [NSString stringWithFormat:@"%i",_currentIndex];
    [self setTitle:title];
}
-(void)nextImage{
    int index = (_currentIndex+kImageCount+1)%kImageCount;
    NSString *imageName = [NSString stringWithFormat:@"%i",index];
    _imageView.image = [UIImage imageNamed:imageName];
    _currentIndex = index;
    [self showPhotoName];
}
-(void)lastImage{
    int index = (_currentIndex+kImageCount-1)%kImageCount;
    NSString *imageName = [NSString stringWithFormat:@"%i",index];
    _imageView.image = [UIImage imageNamed:imageName];
    _currentIndex= index;
    [self showPhotoName];
}
#pragma mark - 手势操作
#pragma mark - 点按隐藏或显示导航栏
-(void)tapImage:(UITapGestureRecognizer *)gesture{
    bool hidden = !self.navigationController.navigationBarHidden;
    [self.navigationController setNavigationBarHidden:hidden animated:YES];
}
#pragma mark - 长按提示是否删除
-(void)longPressImage:(UILongPressGestureRecognizer *)gesture{
    if(gesture.state == UIGestureRecognizerStateBegan){
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"System Info" delegate:nil cancelButtonTitle:@"cancel" destructiveButtonTitle:@"Delete the photo" otherButtonTitles:nil];
        [actionSheet showInView:self.view];
    }
}
#pragma mark - 捏合时缩放图片
-(void)pinchImage:(UIPinchGestureRecognizer *)gesture{
    if(gesture.state == UIGestureRecognizerStateChanged){
        _imageView.transform= CGAffineTransformMakeScale(gesture.scale, gesture.scale);

    }else if(gesture.state == UIGestureRecognizerStateEnded){
        [UIView animateWithDuration:0.5 animations:^{
            _imageView.transform=CGAffineTransformIdentity;
        }];

    }
}
#pragma mark - 旋转图片
-(void)rotateImage:(UIRotationGestureRecognizer *)gesture{
    if(gesture.state == UIGestureRecognizerStateChanged){
        _imageView.transform= CGAffineTransformMakeRotation(gesture.rotation);
    }else if(gesture.state == UIGestureRecognizerStateEnded){
        [UIView animateWithDuration:0.8 animations:^{
            _imageView.transform = CGAffineTransformIdentity;
        }];
    }
}
#pragma mark - 拖动图片
-(void)panImage:(UIPanGestureRecognizer *)gesture{
    if(gesture.state == UIGestureRecognizerStateChanged){
        CGPoint translation = [gesture translationInView:self.view];
        _imageView.transform = CGAffineTransformMakeTranslation(translation.x, translation.y);
    }else if(gesture.state == UIGestureRecognizerStateEnded){
        [UIView animateWithDuration:0.5 animations:^{
            _imageView.transform = CGAffineTransformIdentity;
        }];
    }
}
#pragma mark - 轻扫查看下一张或者上一张
-(void)swipeImage:(UISwipeGestureRecognizer *)gesture{
    if(gesture.direction == UISwipeGestureRecognizerDirectionRight){
        [self nextImage];
    }else if(gesture.direction == UIAccessibilityScrollDirectionLeft){
        [self lastImage];
    }
}
#pragma mark 控制器视图的长按手势
-(void)longPressView:(UILongPressGestureRecognizer *)gesture{
    NSLog(@"view long press!");
}


#pragma mark 手势代理方法
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    //NSLog(@"%i,%i",gestureRecognizer.view.tag,otherGestureRecognizer.view.tag);

    //注意，这里控制只有在UIImageView中才能向下传播，其他情况不允许
    if ([otherGestureRecognizer.view isKindOfClass:[UIImageView class]]) {
        return YES;
    }
    return NO;
}

#pragma mark - 触摸事件
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch begin...");
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch end.");
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
