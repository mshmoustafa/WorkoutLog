//
//  WorkoutLogStore.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/24/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutLogStore.h"

@implementation WorkoutLogStore

#pragma mark - Initialization

- (id)init
{
    self = [super init];
    if (self) {
        workoutPlans = [[NSMutableArray alloc] init];
        workoutEntryTemplates = [[NSMutableArray alloc] init];
        workoutEntries = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dummyInit
{
    WorkoutPlan *plan = [[WorkoutPlan alloc] init];
    plan.name = @"Workout Plan 1";
    plan.days = @[@"Monday", @"Tuesday"];
    
    WorkoutEntryTemplate *workout = [[WorkoutEntryTemplate alloc] init];
    workout.name = @"Workout 1";
    workout.reps = 5;
    workout.sets = 6;
    workout.days = [plan.days copy];
    workout.plan = plan.name;
    
    WorkoutEntryTemplate *workout1 = [workout copy];
    workout1.name = @"Workout 2";
    
    plan.workoutList = @[workout, workout1];
}

+ (WorkoutLogStore *)sharedStore {
    static WorkoutLogStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

#pragma mark - Getters

- (NSMutableArray *)allWorkoutPlans
{
    return workoutPlans;
}

- (NSMutableArray *)allWorkoutEntryTemplates
{
    return workoutEntryTemplates;
}

- (NSMutableArray *)allWorkoutEntries
{
    return workoutEntries;
}

#warning make methods that can create plans, workout templates, and workout entries

@end
