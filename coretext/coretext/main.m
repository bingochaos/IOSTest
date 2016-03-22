//
//  main.m
//  coretext
//
//  Created by 黄斌超 on 10/16/15.
//  Copyright © 2015 bingoc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {

        int __CFDoExternRefOperation(uintptr_t op, id obj) {
            CFBasicHashRef table = 取得对象对应的hash表(obj);
            int count;

            switch (op) {
                case OPERATION_retainCount:
                    count = CFBasicHashGetCountOfKey(table, obj);
                    return count;

                case OPERATION_retain:
                    CFBasicHashAddValue(table, obj);
                    return obj;

                case OPERATION_release:
                    count = CFBasicHashRemoveValue(table, obj);
                    return 0 == count;

            }
        }

        - (NSUInteger) retainCount
        {
            return (NSUInteger)__CFDoExternRefOperation(OPERATION_retainCount, self);
        }

        - (id) retain
        {
            return (id)__CFDoExternRefOperation(OPERATION_retain, self);
        }

        - (void) release
        {
            return __CFDoExternRefOperation(OPERATION_release, self);
        }
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
