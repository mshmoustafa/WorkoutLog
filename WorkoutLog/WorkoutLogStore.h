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

@interface WorkoutLogStore : NSObject
{
#pragma mark - Instance Variables
    NSMutableArray *workoutPlans;
    NSMutableArray *workoutEntryTemplates;
    NSMutableArray *workoutEntries;
}

#pragma mark - Shared Store
+ (WorkoutLogStore *)sharedStore;

#pragma mark - Getters
- (NSMutableArray *)allWorkoutPlans;
- (NSMutableArray *)allWorkoutEntryTemplates;
- (NSMutableArray *)allWorkoutEntries;
- (NSMutableArray *)allWorkoutEntriesByDate;

@end
