//
//  BCMainViewController.m
//  Quartz
//
//  Created by 黄斌超 on 15/9/11.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCMainViewController.h"
#import "BCViewRefresh.h"

@interface BCMainViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>{
    BCViewRefresh *_contentView;
    NSArray *_fontSize;
}

@end

@implementation BCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLayout];
    [self addPickerView];
    // Do any additional setup after loading the view.
}
-(void)initLayout{
    _fontSize = @[@15,@18,@20,@22,@25,@28,@30,@32,@35,@40];
    _contentView = [[BCViewRefresh alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];
    _contentView.backgroundColor = [UIColor whiteColor];
    _contentView.title = @"Hello World!";
    _contentView.fontSize = [_fontSize[0] intValue];
    [self.view addSubview:_contentView];
}
-(void)addPickerView{
    UIPickerView *picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 300, 200, 268)];
    picker.dataSource = self;
    picker.delegate = self;
    [self.view addSubview:picker];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return  1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _fontSize.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return  [NSString stringWithFormat:@"%@号字体",_fontSize[row]];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _contentView.fontSize = [[_fontSize objectAtIndex:row]intValue];
    [_contentView setNeedsDisplay];
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
