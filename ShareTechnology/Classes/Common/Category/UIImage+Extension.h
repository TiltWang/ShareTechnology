//
//  UIImage+Extension.h
//  ShareTechnology
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 thirdx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
///切圆图片
- (UIImage *)circleImage;
// 按照倍数缩放
- (UIImage *)scaleWithMultiple:(CGFloat)multiple;
+ (UIImage*)originImage:(UIImage *)image scaleWithMultiple:(CGFloat)multiple;
@end
