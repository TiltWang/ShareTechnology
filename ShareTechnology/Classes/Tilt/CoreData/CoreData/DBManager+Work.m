//
//  DBManager+Work.m
//  TestCoreData
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 Tilt. All rights reserved.
//

#import "DBManager+Work.h"
#import "TWWork+CoreDataProperties.h"

@implementation DBManager (Work)
///添加
- (void)addWorkWithName:(NSString *)name workId:(NSString *)workId {
    TWWork *w = (TWWork *)[NSEntityDescription insertNewObjectForEntityForName:@"TWWork" inManagedObjectContext:self.dbContext];
//    [w setValue:workId forKey:@"work_id"];
//    [w setValue:name forKey:@"work_name"];
//    [w setWork_id:workId];
//    [w setWork_name:name];
    w.work_id = workId;
    w.work_name = name;
    [self saveContext];
}

///查询
- (void)searchWork {
    // 建立获取数据的请求对象，指明操作的实体为Student
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TWWork"];
    
    // 执行获取操作，获取所有Student托管对象
    NSError *error = nil;
    NSArray<TWWork *> *works = [self.dbContext executeFetchRequest:request error:&error];
    
    // 遍历输出查询结果
    [works enumerateObjectsUsingBlock:^(TWWork * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"Work id :%@  Name : %@", obj.work_id, obj.work_name);
    }];
    
    // 错误处理
    if (error) {
        NSLog(@"CoreData Ergodic Data Error : %@", error);
    }
}
@end
