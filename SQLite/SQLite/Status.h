//
//  Status.h
//  SQLite
//
//  Created by 黄斌超 on 11/6/15.
//  Copyright © 2015 bingoc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Status : NSObject


@property (nonatomic,strong) NSNumber *Id;
@property (nonatomic,strong) User     *user;
@property (nonatomic,copy  ) NSString *createdAt;
@property (nonatomic,copy  ) NSString *source;
@property (nonatomic,copy  ) NSString *text;



-(Status *)initWithCreateAt:(NSString *)createAt source:(NSString *)source text:(NSString *)text user:(User *)user;

-(Status *)initWithCreateAt:(NSString *)createAt source:(NSString *)source text:(NSString *)text userId:(int)userId;

-(Status *)initWithDictionary:(NSDictionary *)dic;

+(Status *)statusWithCreateAt:(NSString *)createAt source:(NSString *)source text:(NSString *)text user:(User *)user;

+(Status *)statusWithCreateAt:(NSString *)createAt source:(NSString *)source text:(NSString *)text userId:(int)userId;
@end
