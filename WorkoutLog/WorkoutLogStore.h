//
//  WorkoutLogStore.h
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/24/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WorkoutPlan.h"
#import "WorkoutEntryTemplate.h"
#import "WorkoutEntry.h"

/**
 Contains arrays of all workout plans, templates, and entries, as well as a method to organize all workout entries by date.
 */
@interface WorkoutLogStore : NSObject <NSCoding>
{
#pragma mark - Instance Variables
    NSMutableArray *workoutPlans;
    NSMutableArray *workoutEntryTemplates;
    NSMutableArray *workoutEntries;
//    NSMutableDictionary *completedWorkoutEntriesToday;
}

#pragma mark - Shared Store
+ (WorkoutLogStore *)sharedStore;

#pragma mark - Getters
- (NSMutableArray *)allWorkoutPlans;
- (NSMutableArray *)allWorkoutEntryTemplates;
- (NSMutableArray *)allWorkoutEntries;
- (NSMutableArray *)allWorkoutEntriesByDate;
- (NSMutableArray *)todayWorkoutEntryTemplates;
- (NSMutableArray *)todayWorkoutEntries;
//- (NSMutableDictionary *)completedWorkoutEntriesToday;

#pragma mark - Time Convenience Methods

/**
 returns the parameter with the hour, minute, and second set to 0 (midnight).
 @code
 NSDate *date = [NSDate date];
 [WorkoutLogStore dateMidnight:date];
 @endcode
 */
+ (NSDate *)dateMidnight:(NSDate *)date;
- (BOOL)workoutEntryExists:(WorkoutEntry *)workoutEntry;

#pragma mark - Adders

- (void)addWorkoutEntryFromTemplate:(WorkoutEntryTemplate *)workoutEntryTemplate;
- (void)addWorkoutEntry:(WorkoutEntry *)workoutEntry;
//- (void)addCompletedWorkoutEntryToday:(WorkoutEntry *)workoutEntry withKey:(NSString *)key;
- (void)addWorkoutEntryTemplate:(WorkoutEntryTemplate *)workoutEntryTemplate;
- (void)addWorkoutPlan:(WorkoutPlan *)plan;


#pragma mark - Deleters

- (void)deleteWorkoutEntryByUID:(NSNumber *)UID andDate:(NSDate *)date;
- (void)deleteWorkoutEntry:(WorkoutEntry *)workoutEntry;
//- (void)deleteCompletedWorkoutEntryTodayByUID:(NSNumber *)UID;

- (void)saveData;

@end
