//
//  DBManager.h
//  TestCoreData
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 Tilt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DBManager : NSObject
@property (nonatomic, strong) NSManagedObjectContext *dbContext;
@property (nonatomic, strong) NSManagedObjectModel *dbModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

///单例对象
+ (instancetype)sharedInstance;

///CoreData Saving support
- (void)saveContext;
@end
