//
//  WorkoutPlan.h
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/23/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkoutPlan : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *days;
@property (strong, nonatomic) NSArray *workoutList;

@end
