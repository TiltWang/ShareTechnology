//
//  TWUser+CoreDataProperties.m
//  TestCoreData
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 Tilt. All rights reserved.
//
//

#import "TWUser+CoreDataProperties.h"

@implementation TWUser (CoreDataProperties)

+ (NSFetchRequest<TWUser *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"TWUser"];
}

@dynamic user_age;
@dynamic user_id;
@dynamic user_name;
@dynamic user_title;
@dynamic has_work;

@end
