//
//  ScrollImageViewController.m
//  ScrollViewImage
//
//  Created by 黄斌超 on 15/9/7.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "ScrollImageViewController.h"
#define SCREEN_WIDTH (getScreenSize().width)
#define SCREEN_HEIGHT (getScreenSize().height)
#define IMAGEVIEW_COUNT 3

@interface ScrollImageViewController ()<UIScrollViewDelegate>{
    UIScrollView *_scrollView;
    UIImageView *_leftImageView;
    UIImageView *_centerImageView;
    UIImageView *_rightImageView;
    UIPageControl *_pageControl;
    UILabel *_label;
    NSMutableDictionary *_imageData;
    int _currentImageIndex;
    int _imageCount;

}
@end

@implementation ScrollImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadImageData];
    [self addScrollView];
    [self addImageViews];
    [self addPageControl];
    [self addLabel];
    [self setDefaultImage];


    // Do any additional setup after loading the view.
}
CGSize getScreenSize() {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) &&
        UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}
#pragma  mark - 加载图片数据
-(void)loadImageData{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"imageInfo" ofType:@"plist"];
    _imageData = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    _imageCount =(int) _imageData.count;
}


#pragma mark - 加载控件
-(void)addScrollView{
    _scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:_scrollView];

    _scrollView.delegate = self;

    _scrollView.contentSize = CGSizeMake(IMAGEVIEW_COUNT*SCREEN_WIDTH, SCREEN_HEIGHT);
    [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
}
#pragma mark - 添加三个图片控件
-(void)addImageViews{
    _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_leftImageView];
    _centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _centerImageView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_centerImageView];
    _rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_rightImageView];

}
#pragma mark - 设置默认图片
-(void)setDefaultImage{
    _leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",_imageCount-1]];
    _centerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",0]];
    _rightImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",1]];
    _currentImageIndex = 0;
    _pageControl.currentPage = _currentImageIndex;
    NSString *imageName = [NSString stringWithFormat:@"%i.jpg",_currentImageIndex   ];
    _label.text = _imageData[imageName];
}
#pragma mark - 添加分页控件
-(void)addPageControl{
    _pageControl = [[UIPageControl alloc]init];
    CGSize size = [_pageControl sizeForNumberOfPages:_imageCount];
    _pageControl.bounds = CGRectMake(0, 0, size.width, size.height);
    _pageControl.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT-100);

    _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:193/255.0 green:219/255.0 blue:249/255.0 alpha:1];
    _pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1];
    _pageControl.numberOfPages = _imageCount;
    [self.view addSubview:_pageControl];
}
#pragma  mark - 添加信息描述控件
-(void)addLabel{
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 30)];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.textColor = [UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1];

    [self.view addSubview:_label];
}
#pragma mark - 滚动停止事件
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self reloadImage];
    //移动到中间
    [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];
    //设置分页
    _pageControl.currentPage=_currentImageIndex;
    //设置描述
    NSString *imageName=[NSString stringWithFormat:@"%i.jpg",_currentImageIndex];
    _label.text=_imageData[imageName];
}
#pragma mark - 重载图片
-(void)reloadImage{
    int leftImageIndex,rightImageIndex;
    CGPoint offset = [_scrollView contentOffset];
    if(offset.x>SCREEN_WIDTH){
        _currentImageIndex = (_currentImageIndex+1)%_imageCount;
    }else if(offset.x<SCREEN_WIDTH) {
        _currentImageIndex  = (_currentImageIndex+_imageCount-1)%_imageCount;
    }
    _centerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",_currentImageIndex]];
    leftImageIndex = (_currentImageIndex-1+_imageCount)%_imageCount;
    rightImageIndex = (_currentImageIndex+1)%_imageCount;
     _leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",leftImageIndex]];
     _rightImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",rightImageIndex]];
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
