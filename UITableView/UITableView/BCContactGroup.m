//
//  BCContactGroup.m
//  UITableView
//
//  Created by 黄斌超 on 15/9/8.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCContactGroup.h"

@implementation BCContactGroup

-(BCContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts{
    if(self = [super init]){
        self.name = name;
        self.detail = detail;
        self.contacts = contacts;
    }
    return  self;
}

+(BCContactGroup *)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts{
    BCContactGroup *contantGroup=[[BCContactGroup alloc]initWithName:name andDetail:detail andContacts:contacts];
    return contantGroup;
}
@end
