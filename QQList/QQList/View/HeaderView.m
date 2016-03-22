//
//  HeaderView.m
//  QQList
//
//  Created by 黄斌超 on 15/9/6.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "HeaderView.h"
#import "JKGroupModel.h"

@implementation HeaderView{
    UIButton *_arrwoBtn;
    UILabel *_label;
}
+(instancetype)headerView:(UITableView *)tableView{
    static NSString *identifier = @"header";
    HeaderView *header = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!header){
        header = [[HeaderView alloc]initWithReuseIdentifier:identifier];
    }
    return  header;
}
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self= [super init]){
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"header_bg"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"header_bg_highlighted"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.contentHorizontalAlignment= UIControlContentHorizontalAlignmentLeft;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        button.imageView.contentMode = UIViewContentModeCenter;
        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside ];
        button.imageView.clipsToBounds = NO;
        _arrwoBtn = button;
        [self addSubview:_arrwoBtn];
        UILabel *labelRight = [[UILabel alloc]init];
        labelRight.textAlignment = NSTextAlignmentCenter;
        _label = labelRight;
        [self addSubview:_label];
    }
    return self;
}
#pragma mark - buttonAction
-(void)buttonAction{
    self.groupModel.isOpen = !self.groupModel.isOpen;
    if([self.delegate respondsToSelector:@selector(clickView)]){
        [self.delegate clickView];
    }
    

}
- (void)didMoveToSuperview{
    _arrwoBtn.imageView.transform = self.groupModel.isOpen? CGAffineTransformMakeRotation(M_PI_2):CGAffineTransformMakeRotation(0);

}
- (void)layoutSubviews{
    [super layoutSubviews];
    _arrwoBtn.frame = self.bounds;
    _label.frame = CGRectMake(self.frame.size.width-70, 0, 60, self.frame.size.height);
}
- (void)setGroupModel:(JKGroupModel *)groupModel{
    _groupModel = groupModel;
    [_arrwoBtn setTitle:_groupModel.name forState:UIControlStateNormal];
    _label.text= [NSString stringWithFormat:@"%@/%lu",_groupModel.online,(unsigned long)_groupModel.friends.count];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
