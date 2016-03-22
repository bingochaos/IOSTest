//
//  main.m
//  Object-C
//
//  Created by 黄斌超 on 15/9/19.
//  Copyright © 2015年 bingoc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#define TLog(_var) ({ NSString *name = @#_var;NSLog(@"%@: %@ -> %p : %@ %d",name,[_var class],_var,_var,(int)[_var retainCount]);})

int main(int argc, char * argv[]) {
    NSString *str1 = [[@"a" mutableCopy] copy];    TLog(str1);
    NSString *str2 = [NSString stringWithFormat:@"%s","a"];  TLog(str2);
    NSString *str3 = [[[@"path/a" lastPathComponent] mutableCopy] copy]; TLog(str3);

    NSString *str4 = [[@"b" mutableCopy] copy]; TLog(str4);
    NSString *str5 = [[@"c" mutableCopy] copy]; TLog(str5);
    NSString *str6 = [[@"d" mutableCopy] copy]; TLog(str6);
    NSString *str7 = [[@"e" mutableCopy] copy]; TLog(str7);
    NSString *str8 = [[@"f" mutableCopy] copy]; TLog(str8);

    NSString *str9 = [[@"\\" mutableCopy] copy]; TLog(str9);
    NSString *str10 = [[@"$" mutableCopy] copy]; TLog(str10);
    NSString *str11 = [[@"." mutableCopy] copy]; TLog(str11);
    NSString *str12 = [[@"aa" mutableCopy] copy]; TLog(str12);

}
