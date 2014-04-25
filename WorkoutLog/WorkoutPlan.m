//
//  WorkoutPlan.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/23/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutPlan.h"

@implementation WorkoutPlan

- (id)init
{
    self = [super init];
    if (self) {
        self.UID = [NSNumber numberWithInt:arc4random()];
        self.name = nil;
        self.days = [[NSMutableOrderedSet alloc] init];
        self.workoutEntryTemplates = [[NSMutableArray alloc] init];
    }
    return self;
}

#warning make methods to create new workouts

- (NSString *)description
{
    return self.name;
}

+ (WorkoutPlan *)createNewPlan
{
    static int planCount = 0;
    
    WorkoutPlan *newPlan = [[WorkoutPlan alloc] init];
    
    newPlan.name = [NSString stringWithFormat:@"%@ %d", @"New Plan", planCount++];
    return newPlan;
}

@end
