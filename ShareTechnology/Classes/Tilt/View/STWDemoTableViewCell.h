//
//  STWDemoTableViewCell.h
//  ShareTechnology
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 thirdx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STWDemoModel.h"

@interface STWDemoTableViewCell : UITableViewCell
@property (nonatomic, strong) STWDemoModel *model;

+ (CGFloat)rowHeight;
@end
