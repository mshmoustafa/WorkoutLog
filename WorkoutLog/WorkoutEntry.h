//
//  WorkoutEntry.h
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/21/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#define WORKOUT_TYPE_WEIGHT         @"Weight/Reps"
#define WORKOUT_TYPE_CARDIO         @"Cardio/Timed"
#define WORKOUT_TYPE_CUSTOM         @"Custom"
#define WORKOUT_TYPES               @[WORKOUT_TYPE_WEIGHT,WORKOUT_TYPE_CARDIO,WORKOUT_TYPE_CUSTOM]

#import <Foundation/Foundation.h>
#import "WorkoutEntryTemplate.h"

@interface WorkoutEntry : WorkoutEntryTemplate <NSCoding>

@property (strong, nonatomic) NSNumber *workoutEntryTemplateUID;

+ (WorkoutEntry *)createNewWorkout;

@end
