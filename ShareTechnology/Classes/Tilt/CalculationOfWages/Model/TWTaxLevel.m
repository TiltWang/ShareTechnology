//
//  TWTaxLevel.m
//  TWPersonalDemo
//
//  Created by Tilt on 2018/10/9.
//  Copyright © 2018年 tilt. All rights reserved.
//

#import "TWTaxLevel.h"

@implementation TWTaxLevel
- (void)setLevel:(NSNumber *)level {
    _level = level;
    _taxLevel = [level integerValue];
}
@end
