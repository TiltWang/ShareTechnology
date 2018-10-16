//
//  TWCalculationOfWagesCommon.h
//  TWPersonalDemo
//
//  Created by Tilt on 2018/10/9.
//  Copyright © 2018年 tilt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STWWagesBill.h"

///税率等级
typedef NS_ENUM(NSUInteger, CalculationOfWagesLevel) {
    CalculationOfWagesLevelZero,    // 0
    CalculationOfWagesLevelOne = 1, // 1
    CalculationOfWagesLevelTwo,     // 2
    CalculationOfWagesLevelThree,   // 3
    CalculationOfWagesLevelFour,    // 4
    CalculationOfWagesLevelFive,    // 5
    CalculationOfWagesLevelSix,     // 6
    CalculationOfWagesLevelSeven,   // 7
};
///起征点 5000
static CGFloat threshold = 5000.0f;
@interface TWCalculationOfWagesCommon : NSObject

/**
 根据税前工资获取工资等级

 @param grossPay 税前工资
 @return 工资等级
 */
+ (CalculationOfWagesLevel)getTaxLevelWithGrossPay:(CGFloat)grossPay;

/**
 根据税前工资获取税后工资
 
 @param grossPay 税前工资
 @return 税后工资
 */
+ (CGFloat)getWagesWithGrossPay:(CGFloat)grossPay;

/**
 根据税前工资获取所要缴纳的税额
 
 @param grossPay 税前工资
 @return 税额
 */
+ (CGFloat)getTaxWithGrossPay:(CGFloat)grossPay;

///获取扣除(五险一金)之后的税前 返回model
+ (STWWagesBill *)getDeductionWithGrossPay:(CGFloat)grossPay;

///获取最后的工资条model
+ (STWWagesBill *)getFinallyWagesBillWithGrossPay:(CGFloat)grossPay;
@end
