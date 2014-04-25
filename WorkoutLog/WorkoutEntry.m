//
//  WorkoutEntry.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/21/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutEntry.h"
#import "RandomString.h"

@implementation WorkoutEntry

#pragma mark - Properties
@synthesize name = _name;
@synthesize date = _date;
@synthesize reps = _reps;
@synthesize sets = _sets;

#pragma mark - Initialization

- (id)init
{
    self = [super init];
    
    //set defaults if no params are given
    //I shouldn't allow any workouts in the same plan to have the same name b/c I'll be looking up workouts based on name.  Workouts in different plans can have the same name.
    [self setUID:[NSNumber numberWithInt:arc4random()]];
    [self setName:nil];
    [self setDate:[NSDate date]]; //this should be the current date
    [self setReps:0];
    [self setSets:0];
    [self setMin:0];
    [self setSec:0];
    
    return self;
}

#pragma mark - Name

- (NSString *)name
{
    return _name;
}

- (void)setName:(NSString *)name
{
    if (name) {
        _name = name;
    } else {
        //provide some unique default name
    }
}

#pragma mark - Date

- (NSDate *)date
{
    return _date;
}

- (void)setDate:(NSDate *)date
{
    if (date) {
        _date = date;
    } else {
        //I don't know what to do if date is nil
    }
}

#pragma mark - Reps

- (NSUInteger)reps
{
    return _reps;
}

- (void)setReps:(NSUInteger)reps
{
    if (reps) {
        _reps = reps;
    }
}

#pragma mark - Sets

- (NSUInteger)sets
{
    return _sets;
}

- (void)setSets:(NSUInteger)sets
{
    if (sets) {
        _sets = sets;
    }
}

- (NSString *)description
{
    return self.name;
}

+ (WorkoutEntry *)createNewWorkout
{
    static int workoutCount = 0;
    
    WorkoutEntry *newWorkout = [[WorkoutEntry alloc] init];
    
    newWorkout.name = [NSString stringWithFormat:@"%@ %d", @"New Workout", workoutCount++];
    return newWorkout;
}

@end
