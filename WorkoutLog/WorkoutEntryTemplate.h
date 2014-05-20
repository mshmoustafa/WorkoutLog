//
//  WorkoutEntryTemplate.h
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/23/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

//#import "WorkoutEntry.h"

//these are only ints, which can't be put in nsarray
//typedef enum {MON, TUE, WED, THU, FRI, SAT, SUN} DaysOfWeek;
//DaysOfWeek dow;
@class WorkoutEntry;

@interface WorkoutEntryTemplate : NSObject <NSCoding>

@property (strong, nonatomic) NSNumber *UID;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSString *plan;
@property (strong, nonatomic) NSString *type;

@property (nonatomic) NSUInteger reps;
@property (nonatomic) NSUInteger sets;
@property (nonatomic) NSUInteger weight;
@property (nonatomic) NSUInteger min;
@property (nonatomic) NSUInteger sec;
@property (strong, nonatomic) NSMutableOrderedSet *days;


- (NSString *)getInfoByType;
- (WorkoutEntry *)makeWorkoutEntryFromTemplate;
+ (WorkoutEntryTemplate *)createNewWorkoutEntryTemplateWithPlan:(NSString *)planName;

@end
