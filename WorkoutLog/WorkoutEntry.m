//
//  WorkoutEntry.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/21/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutEntry.h"
#import "WorkoutLogStore.h"
#import "RandomString.h"

@implementation WorkoutEntry

#pragma mark - Properties
@synthesize name = _name;
@synthesize date = _date;
@synthesize type = _type;
@synthesize reps = _reps;
@synthesize sets = _sets;
@synthesize weight = _weight;

#pragma mark - Initialization

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.UID = [decoder decodeObjectForKey:@"UID"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.date = [decoder decodeObjectForKey:@"date"];
        self.plan = [decoder decodeObjectForKey:@"plan"];
        self.type = [decoder decodeObjectForKey:@"type"];
        self.reps = [decoder decodeIntegerForKey:@"reps"];
        self.sets = [decoder decodeIntegerForKey:@"sets"];
        self.weight = [decoder decodeIntegerForKey:@"weight"];
        self.min = [decoder decodeIntegerForKey:@"min"];
        self.sec = [decoder decodeIntegerForKey:@"sec"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.UID forKey:@"UID"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.date forKey:@"date"];
    [encoder encodeObject:self.plan forKey:@"plan"];
    [encoder encodeObject:self.type forKey:@"type"];
    [encoder encodeInteger:self.reps forKey:@"reps"];
    [encoder encodeInteger:self.sets forKey:@"sets"];
    [encoder encodeInteger:self.weight forKey:@"weight"];
    [encoder encodeInteger:self.min forKey:@"min"];
    [encoder encodeInteger:self.sec forKey:@"sec"];
}

- (id)init
{
    self = [super init];
    
    //set defaults if no params are given
    
    [self setUID:[NSNumber numberWithInt:arc4random()]];
    [self setName:@"Workout"];
    [self setDate:[WorkoutLogStore dateMidnight:[NSDate date]]];
    [self setType:WORKOUT_TYPE_CUSTOM];
    [self setReps:0];
    [self setSets:0];
    [self setWeight:0];
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

+ (WorkoutEntry *)createNewWorkout
{
    static int workoutCount = 0;
    
    WorkoutEntry *newWorkout = [[WorkoutEntry alloc] init];
    
    newWorkout.name = [NSString stringWithFormat:@"%@ %d", @"New Workout", workoutCount++];
    return newWorkout;
}

//- (BOOL)isEqual:(id)object
//{
//    WorkoutEntry *entry = object;
//    if (!([self.date compare:entry.date] == NSOrderedSame)) {
//        return NO;
//    } else if (![self.name isEqualToString:entry.name]) {
//        return NO;
//    } else if (![self.plan isEqualToString:entry.plan]) {
//        return NO;
//    } else if (!self.reps != entry.reps) {
//        return NO;
//    } else if (!self.sets != entry.sets) {
//        return NO;
//    } else if (!self.weight != entry.weight) {
//        return NO;
//    }
//}

- (BOOL)isEqualToWorkoutEntry:(WorkoutEntry *)workoutEntry
{
    if (![self.date isEqualToDate:workoutEntry.date]) {
        return NO;
    } else if ([self.UID isEqualToNumber:workoutEntry.UID]) {
        return NO;
    } else if (![self.name isEqualToString:workoutEntry.name]) {
        return NO;
    } else if (![self.plan isEqualToString:workoutEntry.plan]) {
        return NO;
    } else if (![self.type isEqualToString:workoutEntry.type]) {
        return NO;
    } else if (!self.reps != workoutEntry.reps) {
        return NO;
    } else if (!self.sets != workoutEntry.sets) {
        return NO;
    } else if (!self.weight != workoutEntry.weight) {
        return NO;
    }
    return YES;
}

@end
