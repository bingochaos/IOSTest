//
//  User.h
//  SQLite
//
//  Created by 黄斌超 on 11/6/15.
//  Copyright © 2015 bingoc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic,strong) NSNumber *Id;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *screenName;

@property (nonatomic,copy) NSString *profileImageUrl;

@property (nonatomic,copy) NSString *mbtype;

@property (nonatomic,copy) NSString *city;


-(User *)initWithName:(NSString *)name screenName:(NSString *)screenName profileImageUrl:(NSString *)profileImageUrl mbtype:(NSString *)mbtype city:(NSString *)city;

-(User *)initWithDictionary:(NSDictionary *)dic;

+(User *)userWithName:(NSString *)name screenName:(NSString *)screenName profileImageUrl:(NSString *)profileImageUrl mbtype:(NSString *)mbtype city:(NSString *)city;
@end
