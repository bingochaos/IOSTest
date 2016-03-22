//
//  HeaderView.h
//  QQList
//
//  Created by 黄斌超 on 15/9/6.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKGroupModel.h"

@protocol HeaderViewDelegate <NSObject>

@optional
-(void)clickView;

@end
@interface HeaderView : UITableViewHeaderFooterView
@property (nonatomic ,assign) id<HeaderViewDelegate> delegate;

@property (nonatomic ,strong) JKGroupModel *groupModel;

+(instancetype)headerView:(UITableView *)tableView;

@end
