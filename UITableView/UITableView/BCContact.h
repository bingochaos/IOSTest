//
//  BCContact.h
//  UITableView
//
//  Created by 黄斌超 on 15/9/8.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCContact : NSObject

@property (nonatomic ,copy)NSString *firstName;
@property (nonatomic ,copy)NSString *lastName;
@property (nonatomic ,copy)NSString *phoneNumber;


-(BCContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber;

-(NSString *)getName;


+(BCContact *)initWithFirstName :(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber;
@end
