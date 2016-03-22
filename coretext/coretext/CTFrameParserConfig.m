//
//  CTFrameParserConfig.m
//  coretext
//
//  Created by 黄斌超 on 10/16/15.
//  Copyright © 2015 bingoc. All rights reserved.
//

#import "CTFrameParserConfig.h"
#import "CoreTextDemo-Prefix.pch"
@implementation CTFrameParserConfig

- (id)init
{
    self = [super init];
    if (self) {
        _width = 200.0f;
        _fontSize = 16.0f;
        _lineSpace = 8.0f;
        _textColor = RGB(108, 108, 108);

    }
    return self;
}
@end
