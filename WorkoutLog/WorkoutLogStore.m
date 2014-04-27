//
//  WorkoutLogStore.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/24/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutLogStore.h"
#import "Day.h"
#import "WorkoutsOnDate.h"

@implementation WorkoutLogStore

#pragma mark - Initialization

- (id)init
{
    self = [super init];
    if (self) {
        workoutPlans = [[NSMutableArray alloc] init];
        workoutEntryTemplates = [[NSMutableArray alloc] init];
        workoutEntries = [[NSMutableArray alloc] init];
        [self dummyInit];
        NSLog(@"%@", workoutPlans.description);
        NSLog(@"%@", workoutEntryTemplates.description);
        NSLog(@"%@", workoutEntries.description);
    }
    return self;
}

- (void)dummyInit
{
    WorkoutPlan *plan = [[WorkoutPlan alloc] init];
    plan.name = @"Workout Plan 1";
    Day *day1 = [Day getDay:@"Monday"];
    plan.days = [NSMutableOrderedSet orderedSetWithArray: @[day1]];
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (int i = 0; i < 2; i++) {
        WorkoutEntryTemplate *workout = [[WorkoutEntryTemplate alloc] init];
        workout.name = [NSString stringWithFormat:@"%@%d", @"Workout", i];
        workout.reps = 5;
        workout.sets = 6;
        workout.weight = 30;
        workout.days = [plan.days mutableCopy];
        workout.plan = plan.name;
        [temp addObject:workout];
    }
    
    plan.workoutEntryTemplates = temp;
    workoutEntryTemplates = [NSMutableArray arrayWithArray:plan.workoutEntryTemplates];
    workoutPlans = [NSMutableArray arrayWithArray:@[plan]];
    
    NSDate *now = [NSDate date];
    
    for (int i = 0; i < 5; i++) {
        WorkoutEntry *entry = [((WorkoutEntryTemplate *)[workoutEntryTemplates firstObject]) makeWorkoutEntryFromTemplate];
        entry.date = [NSDate dateWithTimeInterval:(86400 * i) sinceDate:now];
        WorkoutEntry *entry1 = [((WorkoutEntryTemplate *)[workoutEntryTemplates lastObject]) makeWorkoutEntryFromTemplate];
        entry1.date = [NSDate dateWithTimeInterval:(86400 * i) sinceDate:now];
        [workoutEntries addObject:entry];
        [workoutEntries addObject:entry1];
    }
    
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

- (NSMutableArray *)allWorkoutEntriesByDate
{
    NSLog(@"Workout entries: %@", workoutEntries);
    NSMutableArray *workoutEntriesByDate = [[NSMutableArray alloc] init];
    NSMutableOrderedSet *dates = [[NSMutableOrderedSet alloc] init];
    
    for (WorkoutEntry *entry in workoutEntries) {
        BOOL foundDuplicateDate = NO;
        for (NSDate *date in dates) {
            if ([date compare:entry.date] == NSOrderedSame) {
                foundDuplicateDate = YES;
            }
        }
        if (foundDuplicateDate == NO) {
            [dates addObject: entry.date];
        }
    }
    
    NSSortDescriptor *sortDatesDescending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    [dates sortUsingDescriptors:@[sortDatesDescending]];
    NSLog(@"sorted dates: %@", dates);
    
    for (NSDate *date in dates) {
        WorkoutsOnDate *temp = [[WorkoutsOnDate alloc] init];
        temp.date = date;
        for (WorkoutEntry *entry in workoutEntries) {
            if ([date compare:entry.date] == NSOrderedSame) {
                [temp.workoutEntries addObject:entry];
            }
        }
        [workoutEntriesByDate addObject:temp];
    }
    return workoutEntriesByDate;
}

#warning make methods that can create plans, workout templates, and workout entries

@end
