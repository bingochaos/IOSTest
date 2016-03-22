//
//  UserService.m
//  SQLite
//
//  Created by 黄斌超 on 11/6/15.
//  Copyright © 2015 bingoc. All rights reserved.
//

#import "UserService.h"
#import "User.h"
#import "DBManager.h"
@implementation UserService
singleton_implementation(UserService)

- (void)addUser:(User *)user{
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO User (name,screenName,profileImageUrl,mbtype,city) VALUES('%@','%@','%@','%@','%@')",user.name,user.screenName
                     ,user.profileImageUrl,user.mbtype,user.city];
    [[DBManager sharedDBManager]executeNonQuery:sql];
}

- (void)removeUser:(User *)user{
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM User WHERE Id='%@'",user.Id];
    [[DBManager sharedDBManager]executeNonQuery:sql];
}

- (void)removUserByName:(NSString *)name{
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM User WHERE name='%@'",name];
    [[DBManager sharedDBManager]executeNonQuery:sql];

}
- (void)modifyUser:(User *)user{
    NSString *sql = [NSString stringWithFormat:@"UPDATE User SET name='%@',screenName = '%@',profileImageUrl='%@',mbtype='%@',city='%@' WHERE Id='%@'",user.name,user.screenName,user.profileImageUrl,user.mbtype,user.city,user.Id];
    [[DBManager sharedDBManager]executeNonQuery:sql];
}
- (User *)getUserById:(int)Id{
    User *user = [[User alloc]init];
    NSString *sql = [NSString stringWithFormat:@"SELECT name,screenName,profileImageUrl,mbtype,city From User WHERE Id='%i'",Id];
    NSArray *rows = [[DBManager sharedDBManager]executeQuery:sql];
    if(rows&&rows.count>0){
        [user setValuesForKeysWithDictionary:rows[0]];
    }
    return user;
}
- (User *)getUserByName:(NSString *)name{
    User *user = [[User alloc]init];
    NSString *sql = [NSString stringWithFormat:@"SELECT Id,name,screenName,profileImageUrl,mbtype,city FROM User WHERE name = '%@'",name];
    NSArray *rows = [[DBManager sharedDBManager]executeQuery:sql];
    if(rows &&rows.count>0){
        [user setValuesForKeysWithDictionary:rows[0]];
    }
    return user;
}
@end
