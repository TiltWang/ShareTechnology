//
//  DBManager+User.h
//  TestCoreData
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 Tilt. All rights reserved.
//

#import "DBManager.h"

@interface DBManager (User)
///添加
- (void)addUserWithName:(NSString *)name userId:(NSString *)userId workList:(NSArray *)workList;
///添加
- (void)addUserWithName:(NSString *)name userId:(NSString *)userId;

///删除
- (void)deleteUserWithName:(NSString *)name;

///修改
- (void)updateUserName:(NSString *)name replaceAge:(NSInteger)age;

///查询
- (void)searchUser;
@end
