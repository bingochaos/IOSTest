//
//  DatabaseCreator.m
//  SQLite
//
//  Created by 黄斌超 on 11/6/15.
//  Copyright © 2015 bingoc. All rights reserved.
//

#import "DatabaseCreator.h"
#import "DBManager.h"
@implementation DatabaseCreator

+ (void)initDatabase{
    NSString *key = @"IsCreatedDb";
    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
    if([[defaults valueForKey:key] intValue]!=1){
        [self createUserTable];
        [self createUserTable];
        [defaults setValue:@1  forKey:key];
    }
}
+ (void)createUserTable{
    NSString *sql = @"CREATE TABLE User (Id integer PRIMARY KEY AUTOINCREMENT,name text,screenName text,profileImageUrl text,mbtype text,city text)";
    [[DBManager sharedDBManager]executeQuery:sql];
}
+ (void)createStatusTable{
    NSString *sql = @"CREATE TABLE Status (Id integer PRIMARY KEY AUTOINCREMENT, source text,createdAt date,\"text\" text,user integer REFERENCES User (Id))";
    [[DBManager sharedDBManager]executeQuery:sql];
}
@end
