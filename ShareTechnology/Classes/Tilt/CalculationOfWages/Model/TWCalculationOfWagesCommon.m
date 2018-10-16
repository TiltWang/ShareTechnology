//
//  TWCalculationOfWagesCommon.m
//  TWPersonalDemo
//
//  Created by Tilt on 2018/10/9.
//  Copyright © 2018年 tilt. All rights reserved.
//

#import "TWCalculationOfWagesCommon.h"
#import "TWTaxLevel.h"


@implementation TWCalculationOfWagesCommon

+ (CalculationOfWagesLevel)getTaxLevelWithGrossPay:(CGFloat)grossPay {
    CGFloat difference = grossPay - threshold;
    if (difference <= 0) {
        return CalculationOfWagesLevelZero;
    } else if (difference <= 3000) {
        return CalculationOfWagesLevelOne;
    } else if (difference <= 12000) {
        return CalculationOfWagesLevelTwo;
    } else if (difference <= 25000) {
        return CalculationOfWagesLevelThree;
    } else if (difference <= 35000) {
        return CalculationOfWagesLevelFour;
    } else if (difference <= 55000) {
        return CalculationOfWagesLevelFive;
    } else if (difference <= 80000) {
        return CalculationOfWagesLevelSix;
    } else {
        return CalculationOfWagesLevelSeven;
    }
}

+ (NSArray *)getLevelList {
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TaxLevel.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:arr.count];
        for (NSInteger i = 0; i < arr.count; i++) {
            TWTaxLevel *model =  [TWTaxLevel mj_objectWithKeyValues:arr[i]];
            [arrM addObject:model];
        }
    return [arrM copy];
}

+ (CGFloat)getWagesWithGrossPay:(CGFloat)grossPay {
    CalculationOfWagesLevel taxLevel = [TWCalculationOfWagesCommon getTaxLevelWithGrossPay:grossPay];
    NSArray *levelList = [TWCalculationOfWagesCommon getLevelList];
    TWTaxLevel *levelModel;
    for (NSInteger i = 0; i < levelList.count; i++) {
        TWTaxLevel *model = levelList[i];
        if (model.taxLevel == taxLevel) {
            levelModel = model;
        }
    }
    CGFloat rate = [levelModel.taxRate floatValue];
    CGFloat quickDeduction = [levelModel.quickDeduction floatValue];
    return threshold + (grossPay - threshold) * (1 - rate) + quickDeduction;
    
//    return threshold - ([TWCalculationOfWagesCommon getTaxWithGrossPay:grossPay]);
}

+ (CGFloat)getTaxWithGrossPay:(CGFloat)grossPay {
    CalculationOfWagesLevel taxLevel = [TWCalculationOfWagesCommon getTaxLevelWithGrossPay:grossPay];
    NSArray *levelList = [TWCalculationOfWagesCommon getLevelList];
    TWTaxLevel *levelModel;
    for (NSInteger i = 0; i < levelList.count; i++) {
        TWTaxLevel *model = levelList[i];
        if (model.taxLevel == taxLevel) {
            levelModel = model;
        }
    }
    CGFloat rate = [levelModel.taxRate floatValue];
    CGFloat quickDeduction = [levelModel.quickDeduction floatValue];
    return (grossPay - threshold) * rate - quickDeduction;
}

+ (STWWagesBill *)getDeductionWithGrossPay:(CGFloat)grossPay {
    CGFloat pension = grossPay * 0.08;
    CGFloat medical = grossPay * 0.02;
    CGFloat unemployment = grossPay * 0.002;
    CGFloat accumulationFund = grossPay * 0.12;
//    NSLog(@"\n养老:%.2f\n医疗:%.2f\n失业:%.2f\n公积金:%.2f", pension, medical, unemployment, accumulationFund);
    STWWagesBill *model = [[STWWagesBill alloc] init];
    model.pension = pension;
    model.medical = medical;
    model.unemployment = unemployment;
    model.accumulationFund = accumulationFund;
    model.afterGrossPay = grossPay - pension - medical - unemployment - accumulationFund;
    return model;
}

+ (STWWagesBill *)getFinallyWagesBillWithGrossPay:(CGFloat)grossPay {
    STWWagesBill *model = [TWCalculationOfWagesCommon getDeductionWithGrossPay:grossPay];
    model.grossPay = grossPay;
    model.tax = [TWCalculationOfWagesCommon getTaxWithGrossPay:model.afterGrossPay];
    model.salary = [TWCalculationOfWagesCommon getWagesWithGrossPay:model.afterGrossPay];
    return model;
}


@end
