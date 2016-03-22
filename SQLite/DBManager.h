//
//  DBManager.h
//  SQLite
//
//  Created by 黄斌超 on 11/6/15.
//  Copyright © 2015 bingoc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "KCSingleton.h"

@interface DBManager : NSObject
singleton_interface(DBManager);

@property (nonatomic) sqlite3 *database;


- (void)openDb:(NSString *)dbname;

- (void)executeNonQuery:(NSString *)sql;

- (NSArray *)executeQuery:(NSString *)sql;
@end
