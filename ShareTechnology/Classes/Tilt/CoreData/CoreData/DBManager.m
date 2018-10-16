//
//  DBManager.m
//  TestCoreData
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 Tilt. All rights reserved.
//

#import "DBManager.h"

@implementation DBManager
static DBManager *instance = nil;
///单例对象
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DBManager alloc] init];
    });
    return instance;
}


///CoreData Saving support
- (void)saveContext
{
    NSManagedObjectContext *managedObjectContext = self.dbContext;
    if (managedObjectContext != nil)
    {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            // 如果有特殊的错误处理机制，请重写下面的代码.
#warning abort() 会导致软件崩溃退出的同时生成错误日志. 如果你要发布该应用，应当避免使用该方法，它只是在开发阶段会很有用.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        else
        {
            NSLog(@"数据存储成功");
        }
        
    }
}


- (NSManagedObjectContext *)dbContext {
    if (!_dbContext) {
        _dbContext = [self contextWithModelName:@"db"];
    }
    return _dbContext;
}

/**
 创建上下文对象
 */
- (NSManagedObjectContext *)contextWithModelName:(NSString *)modelName {
    // 创建上下文对象，并发队列设置为主队列
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    // 创建托管对象模型，并使用Company.momd路径当做初始化参数
    NSURL *modelPath = [[NSBundle mainBundle] URLForResource:modelName withExtension:@"momd"];
    
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelPath];
    
    // 创建持久化存储调度器
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    // 创建并关联SQLite数据库文件，如果已经存在则不会重复创建
    NSString *dataPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    dataPath = [dataPath stringByAppendingFormat:@"/%@.sqlite", modelName];
    NSLog(@"%@", dataPath);
    NSDictionary *optionsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],
                                       NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES],
                                       NSInferMappingModelAutomaticallyOption, nil];
    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:dataPath] options:optionsDictionary error:nil];
    
    // 上下文对象设置属性为持久化存储器
    context.persistentStoreCoordinator = coordinator;
    
    return context;
}
@end
