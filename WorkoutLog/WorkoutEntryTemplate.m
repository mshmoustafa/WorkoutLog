//
//  WorkoutEntryTemplate.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/23/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutEntry.h"
#import "WorkoutEntryTemplate.h"
#import "UIDGenerator.h"

@implementation WorkoutEntryTemplate

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
        
        self.days = [decoder decodeObjectForKey:@"days"];
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
    
    [encoder encodeObject:self.days forKey:@"days"];
}

- (id) init
{
    self = [super init];
    if (self) {
        [self setUID:[UIDGenerator generateUID]];
        [self setName:@"Workout"];
        [self setPlan:nil];
        [self setType:WORKOUT_TYPE_CUSTOM];
        [self setReps:0];
        [self setSets:0];
        [self setWeight:0];
        [self setMin:0];
        [self setSec:0];
        
#warning days array should never be nil
        self.days = nil;
    }
    return self;
}

#pragma mark - Days

- (void)setDaysWithDays:(NSArray *)days
{
    
}

- (NSString *)description
{
    return self.name;
}

- (NSString *)getInfoByType
{
    if ([self.type isEqualToString:WORKOUT_TYPE_CARDIO]) {
        return [NSString stringWithFormat:@"%02lu:%02lu",(unsigned long)self.min, (unsigned long)self.sec];
    } else if ([self.type isEqualToString:WORKOUT_TYPE_WEIGHT]) {
        return [NSString stringWithFormat:@"%lu Rep(s), %lu Set(s), %lu Weight", (unsigned long)self.reps, (unsigned long)self.sets, (unsigned long)self.weight];
    } else {
        return [NSString stringWithFormat:@"%lu Rep(s), %lu Set(s), %lu Weight, %02lu:%02lu", (unsigned long)self.reps, (unsigned long)self.sets, (unsigned long)self.weight, (unsigned long)self.min, (unsigned long)self.sec];
    }
    
    return nil;
}

- (WorkoutEntry *)makeWorkoutEntryFromTemplate
{
    WorkoutEntry *entry = [[WorkoutEntry alloc] init];
    entry.name = [NSString stringWithString:self.name];
    entry.type = [self.type mutableCopy];
    entry.reps = self.reps;
    entry.sets = self.sets;
    entry.weight = self.weight;
    entry.min = self.min;
    entry.sec = self.sec;
    entry.plan = [self.plan mutableCopy];
    
    entry.workoutEntryTemplateUID = [self.UID copy];
    return entry;
}

+ (WorkoutEntryTemplate *)createNewWorkoutEntryTemplateWithPlan:(NSString *)planName
{
    static int workoutEntryTemplateCount = 0;
    
    WorkoutEntryTemplate *newWorkoutTemplate = [[WorkoutEntryTemplate alloc] init];
    
    newWorkoutTemplate.name = [NSString stringWithFormat:@"%@ %d", @"New Workout Template", workoutEntryTemplateCount++];
    newWorkoutTemplate.plan = planName;
    return newWorkoutTemplate;
}

@end
