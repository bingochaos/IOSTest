//
//  BCContactGroup.h
//  UITableView
//
//  Created by 黄斌超 on 15/9/8.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCContactGroup : NSObject
@property (nonatomic ,copy)NSString *name;
@property (nonatomic ,copy)NSString *detail;
@property (nonatomic , strong)NSMutableArray *contacts;


-(BCContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts;

+(BCContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts;
@end
