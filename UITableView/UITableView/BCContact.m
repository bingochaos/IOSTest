//
//  BCContact.m
//  UITableView
//
//  Created by 黄斌超 on 15/9/8.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "BCContact.h"

@implementation BCContact

-(BCContact *)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber{
    if(self = [super init]){
        self.firstName = firstName;
        self.lastName = lastName;
        self.phoneNumber = phoneNumber;
    }
    return self;
}

-(NSString *)getName{

    return [NSString stringWithFormat:@"%@ %@",_firstName,_lastName];
}


+(BCContact *)initWithFirstName :(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber{
    BCContact *contact = [[BCContact alloc]initWithFirstName:firstName andLastName:lastName andPhoneNumber:phoneNumber];
    return contact;
}
@end
