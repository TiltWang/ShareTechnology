//
//  TWTaxLevel.h
//  TWPersonalDemo
//
//  Created by Tilt on 2018/10/9.
//  Copyright © 2018年 tilt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWCalculationOfWagesCommon.h"

@interface TWTaxLevel : NSObject
/**
 级数
 */
@property (nonatomic, strong) NSNumber *level;
/**
 应纳税所得额(不含税)
 */
@property (nonatomic, strong) NSString *detail;
/**
 应纳税所得额(含税)
 */
@property (nonatomic, strong) NSNumber *outOfPart;
/**
 税率
 */
@property (nonatomic, strong) NSNumber *taxRate;
/**
 速算扣除数
 */
@property (nonatomic, strong) NSNumber *quickDeduction;
/**
 税率等级
 */
@property (nonatomic, assign) CalculationOfWagesLevel taxLevel;
@end
