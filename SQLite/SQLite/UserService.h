//
//  UserService.h
//  SQLite
//
//  Created by 黄斌超 on 11/6/15.
//  Copyright © 2015 bingoc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "KCSingleton.h"
@interface UserService : NSObject
singleton_interface(UserService)


- (void)addUser:(User *)user;


- (void)removeUser:(User *)user;

- (void)removUserByName:(NSString *)name;

- (void)modifyUser:(User *)user;

- (User *)getUserById:(int)Id;

- (User *)getUserByName:(NSString *)name;
@end
