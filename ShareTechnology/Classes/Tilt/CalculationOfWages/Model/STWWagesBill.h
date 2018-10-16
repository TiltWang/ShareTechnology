//
//  STWWagesBill.h
//  ShareTechnology
//
//  Created by Tilt on 2018/10/16.
//  Copyright © 2018年 thirdx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STWWagesBill : NSObject

///税前工资
@property (nonatomic, assign) CGFloat grossPay;
///养老
@property (nonatomic, assign) CGFloat pension;
///医疗
@property (nonatomic, assign) CGFloat medical;
///失业
@property (nonatomic, assign) CGFloat unemployment;
///公积金
@property (nonatomic, assign) CGFloat accumulationFund;
///税
@property (nonatomic, assign) CGFloat tax;
///到手工资
@property (nonatomic, assign) CGFloat salary;
///计算完五险一金之后的税前
@property (nonatomic, assign) CGFloat afterGrossPay;
///
@property (nonatomic, strong) NSString *printStr;
@end
