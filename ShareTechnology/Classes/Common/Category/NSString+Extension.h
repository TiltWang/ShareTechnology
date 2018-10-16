//
//  NSString+Extension.h
//  ShareTechnology
//
//  Created by Tilt on 2018/10/16.
//  Copyright © 2018年 thirdx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
//求字符串的高度
- (CGFloat)getStringHeightWithFont:(UIFont *)font textMaxWidth:(CGFloat)maxWidth;
//求字符串的宽度
- (CGFloat)getStringWidthWithFont:(UIFont *)font textMaxHeight:(CGFloat)maxHeight;
@end
