//
//  BCImageData.h
//  线程同步
//
//  Created by 黄斌超 on 15/9/18.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BCImageData : NSObject
@property (nonatomic ,assign)int index;
@property (nonatomic ,strong)NSData *imageData;
@end
