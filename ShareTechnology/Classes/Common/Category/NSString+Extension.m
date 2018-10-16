//
//  NSString+Extension.m
//  ShareTechnology
//
//  Created by Tilt on 2018/10/16.
//  Copyright © 2018年 thirdx. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
#pragma mark - 求字符串的size
//求字符串的高度
- (CGFloat)getStringHeightWithFont:(UIFont *)font textMaxWidth:(CGFloat)maxWidth {
    CGSize maxSize = CGSizeMake(maxWidth, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size.height;
}
//求字符串的宽度
- (CGFloat)getStringWidthWithFont:(UIFont *)font textMaxHeight:(CGFloat)maxHeight {
    CGSize maxSize = CGSizeMake(MAXFLOAT, maxHeight);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size.width;
}
@end
