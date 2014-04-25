//
//  WorkoutEntryTemplate.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/23/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutEntry.h"
#import "WorkoutEntryTemplate.h"

@implementation WorkoutEntryTemplate

#pragma mark - Initialization

- (id) init
{
    self = [super init];
#warning days array should never be nil
    self.days = nil;
    return self;
}

#pragma mark - Days

- (void)setDaysWithDays:(NSArray *)days
{
    
}

- (WorkoutEntry *)makeWorkoutEntryFromTemplate
{
    WorkoutEntry *entry = [[WorkoutEntry alloc] init];
    entry.name = [NSString stringWithString:self.name];
    entry.reps = self.reps;
    entry.sets = self.sets;
    entry.min = self.min;
    entry.sec = self.sec;
    entry.plan = [self.plan mutableCopy];
    return entry;
}

- (WorkoutEntryTemplate *)createNewWorkoutEntryTemplate
{
    static int workoutEntryTemplateCount = 0;
    
    WorkoutEntryTemplate *newWorkoutTemplate = [[WorkoutEntryTemplate alloc] init];
    
    newWorkoutTemplate.name = [NSString stringWithFormat:@"%@ %d", @"New Workout Template", workoutEntryTemplateCount++];
    return newWorkoutTemplate;
}

@end
