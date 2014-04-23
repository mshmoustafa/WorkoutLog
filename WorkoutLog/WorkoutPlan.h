//
//  WorkoutPlan.h
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/23/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkoutPlan : NSObject

//name of the plan
@property (strong, nonatomic) NSString *name;
//days the workouts in the plan should be done
@property (strong, nonatomic) NSArray *days;
//an array of the workout entries in the plan
@property (strong, nonatomic) NSArray *workoutList;

@end
