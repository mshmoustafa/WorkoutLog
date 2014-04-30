//
//  WorkoutEntryTemplate.h
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/23/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutEntry.h"

//these are only ints, which can't be put in nsarray
//typedef enum {MON, TUE, WED, THU, FRI, SAT, SUN} DaysOfWeek;
//DaysOfWeek dow;

@interface WorkoutEntryTemplate : WorkoutEntry <NSCoding>

@property (strong, nonatomic) NSMutableOrderedSet *days;

- (WorkoutEntry *)makeWorkoutEntryFromTemplate;
//+ (WorkoutEntryTemplate *)createNewWorkoutEntryTemplate;

@end
