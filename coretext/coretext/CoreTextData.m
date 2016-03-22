//
//  CoreTextData.m
//  coretext
//
//  Created by 黄斌超 on 10/16/15.
//  Copyright © 2015 bingoc. All rights reserved.
//

#import "CoreTextData.h"

@implementation CoreTextData
- (void)setCtFrame:(CTFrameRef)ctFrame{
    if(_ctFrame!=ctFrame){
        if(_ctFrame !=nil){
            CFRelease(_ctFrame);
        }
        CFRetain(ctFrame);
        _ctFrame = ctFrame;
    }
}

- (void)dealloc{
    if(_ctFrame !=nil){
        CFRelease(_ctFrame);
        _ctFrame = nil;
    }
}
@end
