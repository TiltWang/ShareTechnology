//
//  TWUser+CoreDataProperties.h
//  TestCoreData
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 Tilt. All rights reserved.
//
//

#import "TWUser+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface TWUser (CoreDataProperties)

+ (NSFetchRequest<TWUser *> *)fetchRequest;

@property (nonatomic) int16_t user_age;
@property (nullable, nonatomic, copy) NSString *user_id;
@property (nullable, nonatomic, copy) NSString *user_name;
@property (nullable, nonatomic, copy) NSString *user_title;
@property (nullable, nonatomic, retain) NSSet<TWWork *> *has_work;

@end

@interface TWUser (CoreDataGeneratedAccessors)

- (void)addHas_workObject:(TWWork *)value;
- (void)removeHas_workObject:(TWWork *)value;
- (void)addHas_work:(NSSet<TWWork *> *)values;
- (void)removeHas_work:(NSSet<TWWork *> *)values;

@end

NS_ASSUME_NONNULL_END
