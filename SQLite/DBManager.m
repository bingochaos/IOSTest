//
//  DBManager.m
//  SQLite
//
//  Created by 黄斌超 on 11/6/15.
//  Copyright © 2015 bingoc. All rights reserved.
//

#import "DBManager.h"
#import <sqlite3.h>
#import "KCSingleton.h"
#import "KCAppConfig.h"

#ifndef kDatabaseName

#define kDatabaseName @"myDatabase.db"

#endif
@interface DBManager()

@end

@implementation DBManager

singleton_implementation(DBManager)
#pragma mark 重写初始化
- (instancetype)init{
    DBManager *manger;
    if ((manger=[super init])) {
        [manger openDb:kDatabaseName];
    }
    return manger;
}

- (void)openDb:(NSString *)dbname{
    NSString *directory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"%@",directory);
    NSString *filePath = [directory stringByAppendingPathComponent:dbname];
    if(SQLITE_OK == sqlite3_open(filePath.UTF8String, &_database)){
        NSLog(@"数据库打开成功");
    }else{
        NSLog(@"数据库打开失败");
    }
}
- (void)executeNonQuery:(NSString *)sql{
    char *error;

    if(SQLITE_OK!=sqlite3_exec(_database, sql.UTF8String, NULL, NULL, &error)){
        NSLog(@"执行SQL语句过程中发生错误！错误信息：%s",error);
    }
}
- (NSArray *)executeQuery:(NSString *)sql{
    NSMutableArray *rows = [NSMutableArray array];

    sqlite3_stmt *stmt;

    if(SQLITE_OK == sqlite3_prepare_v2(_database, sql.UTF8String, -1, &stmt, NULL)){
        while (SQLITE_ROW==sqlite3_step(stmt)) {
            int columCount = sqlite3_column_count(stmt);
            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
            for(int i = 0;i<columCount;i++){
                const char *name = sqlite3_column_name(stmt, i);
                const unsigned char *value = sqlite3_column_text(stmt, i);
                dic[[NSString stringWithUTF8String:name]]==[NSString stringWithUTF8String:(const char*)value];
            }
            [rows addObject:dic];
        }
    }
    sqlite3_finalize(stmt);
    return rows;
}
@end