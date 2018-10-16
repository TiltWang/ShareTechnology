//
//  NSString+CreateImage.h
//  ShareTechnology
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 thirdx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (CreateImage)

/**
 通过文字生成有文字的图片(默认样式,背景色随机,文字颜色为白色)

 @param size 生成的图片大小
 @param fontSize 文字字体大小
 @return 返回生成的图片
 */
- (UIImage *)getWordImageRandomBackgroundColorWithSize:(CGSize)size fontSize:(CGFloat)fontSize;

/**
 通过文字生成有文字的图片

 @param size 生成的图片大小
 @param fontSize 文字字体大小
 @param textColor 文字字体颜色
 @param backgroundColor 图片背景颜色
 @return 生成的文字图片
 */
- (UIImage *)getWordImageWithSize:(CGSize)size fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor;

//把文字绘制到图片上
/**
 向图片中添加文字 并返回生成的图片

 @param fontSize 文字字体大小
  @param textColor 文字字体颜色
 @param img 背景图片
 @return 返回文字图片
 */
- (UIImage *)addWordTextWithFontSize:(CGFloat)fontSize textColor:(UIColor *)textColor toImage:(UIImage *)img;
@end
