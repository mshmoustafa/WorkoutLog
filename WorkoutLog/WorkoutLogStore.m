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
