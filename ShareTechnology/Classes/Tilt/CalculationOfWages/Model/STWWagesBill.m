//
//  STWWagesBill.m
//  ShareTechnology
//
//  Created by Tilt on 2018/10/16.
//  Copyright © 2018年 thirdx. All rights reserved.
//

#import "STWWagesBill.h"

@implementation STWWagesBill
- (NSString *)printStr {
    return [NSString stringWithFormat:@"工资条如下:\n\n税前工资: %.2f\n养老: %.2f\n医疗: %.2f\n失业: %.2f\n公积金: %.2f\n税: %.2f\n到手工资: %.2f\n\n===仅供参考===", self.grossPay, self.pension, self.medical, self.unemployment, self.accumulationFund, self.tax, self.salary];
}
@end
