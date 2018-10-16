//
//  TWWork+CoreDataProperties.m
//  TestCoreData
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 Tilt. All rights reserved.
//
//

#import "TWWork+CoreDataProperties.h"

@implementation TWWork (CoreDataProperties)

+ (NSFetchRequest<TWWork *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"TWWork"];
}

@dynamic work_id;
@dynamic work_name;
@dynamic has_user;

@end
