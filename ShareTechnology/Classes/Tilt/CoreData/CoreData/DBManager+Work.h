//
//  DBManager+Work.h
//  TestCoreData
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 Tilt. All rights reserved.
//

#import "DBManager.h"

@interface DBManager (Work)
///添加
- (void)addWorkWithName:(NSString *)name workId:(NSString *)workId;

///查询
- (void)searchWork;
@end
