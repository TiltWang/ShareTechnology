//
//  DBManager+User.m
//  TestCoreData
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 Tilt. All rights reserved.
//

#import "DBManager+User.h"
#import "TWUser+CoreDataProperties.h"
#import "TWWork+CoreDataProperties.h"

@implementation DBManager (User)
///添加
- (void)addUserWithName:(NSString *)name userId:(NSString *)userId workList:(NSArray *)workList {
    TWUser *u = (TWUser *)[NSEntityDescription insertNewObjectForEntityForName:@"TWUser" inManagedObjectContext:self.dbContext];
    u.user_id = userId;
    u.user_name = name;
    u.user_age = 15;
    u.user_title = @"22";
    if (workList.count > 0) {
//        for (NSInteger i = 0; i < workList.count; i++) {
//            TWWork *work = workList[i];
//        }
        u.has_work = [NSSet setWithArray:workList];
    }
    [self saveContext];
}

- (void)addUserWithName:(NSString *)name userId:(NSString *)userId {
    TWUser *u = (TWUser *)[NSEntityDescription insertNewObjectForEntityForName:@"TWUser" inManagedObjectContext:self.dbContext];
    u.user_id = userId;
    u.user_name = name;
    u.user_age = 15;
    u.user_title = @"22";
    TWWork *w = (TWWork *)[NSEntityDescription insertNewObjectForEntityForName:@"TWWork" inManagedObjectContext:self.dbContext];
    w.work_id = @"892";
    w.work_name = @"iOS2";
    u.has_work = [NSSet setWithObjects:w, nil];
    [self saveContext];
}


///删除
- (void)deleteUserWithName:(NSString *)name {
    // 建立获取数据的请求对象，指明对Student实体进行删除操作
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TWUser"];
    
    // 创建谓词对象，过滤出符合要求的对象，也就是要删除的对象
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"user_name = %@", name];
    request.predicate      = predicate;
    
    // 执行获取操作，找到要删除的对象
    NSError *error = nil;
    NSArray<TWUser *> *users = [self.dbContext executeFetchRequest:request error:&error];
    
    // 遍历符合删除要求的对象数组，执行删除操作
    [users enumerateObjectsUsingBlock:^(TWUser * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.dbContext deleteObject:obj];
    }];
    
    //    // 保存上下文，并判断当前上下文是否有改动
    //    if (self.dbContext.hasChanges) {
    //        [self.dbContext save:nil];
    //    }
    [self saveContext];
    
    // 错误处理
    if (error) {
        NSLog(@"CoreData Delete Data Error : %@", error);
    }
}

///修改
- (void)updateUserName:(NSString *)name replaceAge:(NSInteger)age {
    // 建立获取数据的请求对象，并指明操作的实体为Student
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TWUser"];
    //            NSFetchRequest *pRequest = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    
    // 创建谓词对象，设置过滤条件
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"user_name = %@", name];
    request.predicate      = predicate;
    
    // 执行获取请求，获取到符合要求的托管对象
    NSError *error = nil;
    NSArray<TWUser *> *users = [self.dbContext executeFetchRequest:request error:&error];
    
    // 遍历获取到的数组，并执行修改操作
    [users enumerateObjectsUsingBlock:^(TWUser * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj.user_age = age;
    }];
    
    //    // 将上面的修改进行存储
    //    if (self.dbContext.hasChanges) {
    //        [self.dbContext save:nil];
    //    }
    [self saveContext];
    // 错误处理
    if (error) {
        NSLog(@"CoreData Update Data Error : %@", error);
    }
    
    /**
     在上面简单的设置了NSPredicate的过滤条件，对于比较复杂的业务需求，还可以设置复合过滤条件，例如下面的例子
     [NSPredicate predicateWithFormat:@"(age < 25) AND (firstName = XiaoZhuang)"]
     
     也可以通过NSCompoundPredicate对象来设置复合过滤条件
     [[NSCompoundPredicate alloc] initWithType:NSAndPredicateType subpredicates:@[predicate1, predicate2]]
     */
}

///查询
- (void)searchUser {
    // 建立获取数据的请求对象，指明操作的实体为Student
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TWUser"];
    
    // 执行获取操作，获取所有Student托管对象
    NSError *error = nil;
    NSArray<TWUser *> *users = [self.dbContext executeFetchRequest:request error:&error];
    
    // 遍历输出查询结果
    [users enumerateObjectsUsingBlock:^(TWUser * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"User id :%@  Name : %@ Work: %@ Age: %hd", obj.user_id, obj.user_name, obj.has_work, obj.user_age);
    }];
    
    // 错误处理
    if (error) {
        NSLog(@"CoreData Ergodic Data Error : %@", error);
    }
}
@end
