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

@interface WorkoutEntry : NSObject <NSCoding>

@property (strong, nonatomic) NSNumber *UID;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSString *plan;
@property (strong, nonatomic) NSString *type;

@property (nonatomic) NSUInteger reps;
@property (nonatomic) NSUInteger sets;
@property (nonatomic) NSUInteger weight;
@property (nonatomic) NSUInteger min;
@property (nonatomic) NSUInteger sec;

- (NSString *)getInfoByType;
+ (WorkoutEntry *)createNewWorkout;

@end
