//
//  NSString+CreateImage.m
//  ShareTechnology
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 thirdx. All rights reserved.
//

#import "NSString+CreateImage.h"

@implementation NSString (CreateImage)

- (UIImage *)getWordImageRandomBackgroundColorWithSize:(CGSize)size fontSize:(CGFloat)fontSize {
    return [self getWordImageWithSize:size fontSize:fontSize textColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0]];
}

- (UIImage *)getWordImageWithSize:(CGSize)size fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [backgroundColor CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSString *headerName = nil;
    if (self.length < 3) {
        headerName = self;
    }else{
        headerName = [self substringFromIndex:self.length - 2];
    }
    UIImage *headerimg = [self addWordTextWithFontSize:fontSize textColor:textColor toImage:img];
    return headerimg;
}

//把文字绘制到图片上
- (UIImage *)addWordTextWithFontSize:(CGFloat)fontSize textColor:(UIColor *)textColor toImage:(UIImage *)img {
    //1.获取上下文
    UIGraphicsBeginImageContext(img.size);
    //2.绘制图片
    [img drawInRect:CGRectMake(0, 0, img.size.width, img.size.height)];
    //3.绘制文字
    CGRect rect = CGRectMake(0, (img.size.height - fontSize) / 2, img.size.width, 25);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentCenter;
    //文字的属性
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSParagraphStyleAttributeName:style,NSForegroundColorAttributeName:textColor};
    //将文字绘制上去
    [self drawInRect:rect withAttributes:dic];
    //4.获取绘制到得图片
    UIImage *watermarkImg = UIGraphicsGetImageFromCurrentImageContext();
    //5.结束图片的绘制
    UIGraphicsEndImageContext();
    
    return watermarkImg;
}


@end
