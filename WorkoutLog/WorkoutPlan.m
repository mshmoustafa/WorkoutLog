//
//  WorkoutPlan.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/23/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutPlan.h"
#import "WorkoutEntryTemplate.h"

@implementation WorkoutPlan

@synthesize name = _name;

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.UID = [decoder decodeObjectForKey:@"UID"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.days = [decoder decodeObjectForKey:@"days"];
        self.workoutEntryTemplates = [decoder decodeObjectForKey:@"workoutEntryTemplates"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.UID forKey:@"UID"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.days forKey:@"days"];
    [encoder encodeObject:self.workoutEntryTemplates forKey:@"workoutEntryTemplates"];
}

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

- (void)setName:(NSString *)name
{
    _name = name;
    for (WorkoutEntryTemplate *workout in self.workoutEntryTemplates) {
        workout.plan = _name;
    }
}

+ (WorkoutPlan *)createNewPlan
{
    static int planCount = 0;
    
    WorkoutPlan *newPlan = [[WorkoutPlan alloc] init];
    
    newPlan.name = [NSString stringWithFormat:@"%@ %d", @"New Plan", planCount++];
    return newPlan;
}

@end
