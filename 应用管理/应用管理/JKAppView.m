//
//  JKAppView.m
//  应用管理
//
//  Created by 黄斌超 on 15/9/4.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "JKAppView.h"
#import "JKAppInfo.h"


@interface JKAppView()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *namelabel;


@end
@implementation JKAppView
- (IBAction)download:(UIButton *)sender {
    if([self.delegate respondsToSelector:@selector(downloadClickWithBtn:)]){
        [self.delegate downloadClickWithBtn:sender];
    }
}

+ (instancetype)appView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"JKAppView" owner:nil options:nil] lastObject];
}
- (void)setAppInfo:(JKAppInfo *)appInfo
{
    _appInfo = appInfo;

    self.iconView.image = appInfo.image;
    self.namelabel.text = appInfo.name;
}

@end
