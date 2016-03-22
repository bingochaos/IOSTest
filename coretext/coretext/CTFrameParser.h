//
//  CTFrameParser.h
//  coretext
//
//  Created by 黄斌超 on 10/16/15.
//  Copyright © 2015 bingoc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreTextData.h"
#import "CTFrameParserConfig.h"
@interface CTFrameParser : NSObject

+ (CoreTextData *)parseContent:(NSString *)content config:(CTFrameParserConfig*)config;
@end
