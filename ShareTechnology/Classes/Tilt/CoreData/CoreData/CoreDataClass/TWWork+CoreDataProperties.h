//
//  TWWork+CoreDataProperties.h
//  TestCoreData
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 Tilt. All rights reserved.
//
//

#import "TWWork+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface TWWork (CoreDataProperties)

+ (NSFetchRequest<TWWork *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *work_id;
@property (nullable, nonatomic, copy) NSString *work_name;
@property (nullable, nonatomic, retain) TWUser *has_user;

@end

NS_ASSUME_NONNULL_END
