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

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        workoutPlans = [decoder decodeObjectForKey:@"workoutPlans"];
        workoutEntryTemplates = [decoder decodeObjectForKey:@"workoutEntryTemplates"];
        workoutEntries = [decoder decodeObjectForKey:@"workoutEntries"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:workoutPlans forKey:@"workoutPlans"];
    [encoder encodeObject:workoutEntryTemplates forKey:@"workoutEntryTemplates"];
    [encoder encodeObject:workoutEntries forKey:@"workoutEntries"];
}

- (id)init
{
    self = [super init];
    if (self) {
        workoutPlans = [[NSMutableArray alloc] init];
        workoutEntryTemplates = [[NSMutableArray alloc] init];
        workoutEntries = [[NSMutableArray alloc] init];
//        [self dummyInit];
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
    Day *day1 = [Day getDay:@"Wednesday"];
    plan.days = [NSMutableOrderedSet orderedSetWithArray: @[day1]];
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (int i = 0; i < 2; i++) {
        WorkoutEntryTemplate *workout = [[WorkoutEntryTemplate alloc] init];
        [temp addObject:workout];
        workout.name = [NSString stringWithFormat:@"%@%d", @"Workout ", i];
        workout.reps = 5;
        workout.sets = 6;
        workout.weight = 30;
        workout.days = [plan.days mutableCopy];
        workout.plan = plan.name;
        
    }
    
    plan.workoutEntryTemplates = temp;
    workoutEntryTemplates = [NSMutableArray arrayWithArray:plan.workoutEntryTemplates];
    workoutPlans = [NSMutableArray arrayWithArray:@[plan]];
    
    NSDate *todayMidnight = [NSDate date];
    
    todayMidnight = [WorkoutLogStore dateMidnight:todayMidnight];
    
    for (int i = 0; i < 5; i++) {
        WorkoutEntry *entry = [((WorkoutEntryTemplate *)[workoutEntryTemplates firstObject]) makeWorkoutEntryFromTemplate];
        entry.date = [NSDate dateWithTimeInterval:(86400 * i) sinceDate:todayMidnight];
        WorkoutEntry *entry1 = [((WorkoutEntryTemplate *)[workoutEntryTemplates lastObject]) makeWorkoutEntryFromTemplate];
        entry1.date = [NSDate dateWithTimeInterval:(86400 * i) sinceDate:todayMidnight];
//        NSLog(@"Workout entry dates: %@ - %@", entry.date, entry1.date);
        [workoutEntries addObject:entry];
        [workoutEntries addObject:entry1];
    }
    
//    [self todayWorkoutEntryTemplates];
    
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

- (NSMutableArray *)todayWorkoutEntryTemplates
{
    NSMutableOrderedSet *todaysPlans = [[NSMutableOrderedSet alloc] init];
    NSMutableArray *todaysWorkouts = [[NSMutableArray alloc] init];
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [cal components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
//    NSLog(@"Today is: %d", components.weekday);
    
    Day *today = [Day getDayByNumber:[NSNumber numberWithInt:components.weekday]];
    
    for (WorkoutPlan *plan in [[WorkoutLogStore sharedStore] allWorkoutPlans]) {
        for (Day *day in plan.days) {
            if ([day.dayName isEqualToString:today.dayName]) {
                [todaysPlans addObject:plan];
            }
        }
    }
    
    for (WorkoutPlan *plan in todaysPlans) {
        for (WorkoutEntryTemplate *template in plan.workoutEntryTemplates) {
            [todaysWorkouts addObject:template];
        }
    }
    
    return todaysWorkouts;
}

#warning make methods that can create plans, workout templates, and workout entries

+ (NSDate *)dateMidnight:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *Midnight = [calendar components:(NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit | NSTimeZoneCalendarUnit) fromDate:date];
    
    Midnight.hour = 0;
    Midnight.minute = 0;
    Midnight.second = 0;
    Midnight.timeZone = [[NSCalendar currentCalendar] timeZone];
    
    date = [calendar dateFromComponents:Midnight];
    return date;
}

- (void)loadData
{
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSMutableString *documentPath = [NSMutableString stringWithString:[searchPaths lastObject]];
    
    NSString *file = [documentPath stringByAppendingString:@"/plans.archive"];
    
    [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    
    file = [documentPath stringByAppendingString:@"/templates.archive"];
    
    [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    
    file = [documentPath stringByAppendingString:@"/entries.archive"];
    
    [NSKeyedUnarchiver unarchiveObjectWithFile:file];
}

- (void)saveData
{
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSMutableString *documentPath = [NSMutableString stringWithString:[searchPaths lastObject]];
    
    NSString *file = [documentPath stringByAppendingString:@"/plans.archive"];
    
    [NSKeyedArchiver archiveRootObject:workoutPlans toFile:file];
    
    file = [documentPath stringByAppendingString:@"/templates.archive"];
    
    [NSKeyedArchiver archiveRootObject:workoutEntryTemplates toFile:file];
    
    file = [documentPath stringByAppendingString:@"/entries.archive"];
    
    [NSKeyedArchiver archiveRootObject:workoutEntries toFile:file];
}

+ (NSString *)applicationDocumentsDirectory
{
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSMutableString *documentPath = [NSMutableString stringWithString:[searchPaths lastObject]];
    
    [documentPath appendString:@"/workoutlogstore.archive"];
    
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:documentPath];
    
    if (!fileExists) {
        //do nothing
    }
    
    NSLog(documentPath);
    
//    return [NSURL fileURLWithPath:documentPath];
    return documentPath;
}

# pragma mark - NSCoding



@end
