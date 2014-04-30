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

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.UID = [decoder decodeObjectForKey:@"UID"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.date = [decoder decodeObjectForKey:@"date"];
        self.plan = [decoder decodeObjectForKey:@"plan"];
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
    entry.weight = self.weight;
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
