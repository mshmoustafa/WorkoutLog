//
//  Day.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 4/25/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "Day.h"

NSArray *daysOfWeek;

@interface Day ()

+ (void)initializeDaysOfWeek;

@end

@implementation Day

+ (void)initializeDaysOfWeek
{
    static BOOL initialized = NO;
    if (initialized == NO) {
        daysOfWeek = [[NSArray alloc] init];
        Day *SUNDAY = [[Day alloc] init];
        SUNDAY.dayName = @"Sunday";
        SUNDAY.shortDay = @"Sun";
        SUNDAY.dayNumber = @1;
        Day *MONDAY = [[Day alloc] init];
        MONDAY.dayName = @"Monday";
        MONDAY.shortDay = @"Mon";
        MONDAY.dayNumber = @2;
        Day *TUESDAY = [[Day alloc] init];
        TUESDAY.dayName = @"Tuesday";
        TUESDAY.shortDay = @"Tue";
        TUESDAY.dayNumber = @3;
        Day *WEDNESDAY = [[Day alloc] init];
        WEDNESDAY.dayName = @"Wednesday";
        WEDNESDAY.shortDay = @"Wed";
        WEDNESDAY.dayNumber = @4;
        Day *THURSDAY = [[Day alloc] init];
        THURSDAY.dayName = @"Thursday";
        THURSDAY.shortDay = @"Thu";
        THURSDAY.dayNumber = @5;
        Day *FRIDAY = [[Day alloc] init];
        FRIDAY.dayName = @"Friday";
        FRIDAY.shortDay = @"Fri";
        FRIDAY.dayNumber = @6;
        Day *SATURDAY = [[Day alloc] init];
        SATURDAY.dayName = @"Saturday";
        SATURDAY.shortDay = @"Sat";
        SATURDAY.dayNumber = @7;
        
        daysOfWeek = @[SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY];
        
        initialized = YES;
    }
}

+ (Day *)getDay:(NSString *)dayString
{
    [Day initializeDaysOfWeek];
    
    for (Day *day in daysOfWeek) {
        if ([dayString isEqualToString:day.dayName] || [dayString isEqualToString:day.shortDay]) {
            return day;
        }
    }
    return nil;
//    Day *day = [[Day alloc] init];
//    if ([dayString isEqualToString:@"Sunday"]) {
//        day.dayName = dayString;
//        day.shortDay = [dayString substringToIndex:3];
//        day.dayNumber = @1;
//    } else if ([dayString isEqualToString:@"Monday"]) {
//        day.dayName = dayString;
//        day.shortDay = [dayString substringToIndex:3];
//        day.dayNumber = @2;
//    } else if ([dayString isEqualToString:@"Tuesday"]) {
//        day.dayName = dayString;
//        day.shortDay = [dayString substringToIndex:3];
//        day.dayNumber = @3;
//    } else if ([dayString isEqualToString:@"Wednesday"]) {
//        day.dayName = dayString;
//        day.shortDay = [dayString substringToIndex:3];
//        day.dayNumber = @4;
//    } else if ([dayString isEqualToString:@"Thursday"]) {
//        day.dayName = dayString;
//        day.shortDay = [dayString substringToIndex:3];
//        day.dayNumber = @5;
//    } else if ([dayString isEqualToString:@"Friday"]) {
//        day.dayName = dayString;
//        day.shortDay = [dayString substringToIndex:3];
//        day.dayNumber = @6;
//    } else if ([dayString isEqualToString:@"Saturday"]) {
//        day.dayName = dayString;
//        day.shortDay = [dayString substringToIndex:3];
//        day.dayNumber = @7;
//    }
}

+ (Day *)getDayByNumber:(NSNumber *)number
{
    for (Day *day in daysOfWeek) {
        if ([day.dayNumber isEqualToNumber:number]) {
            return day;
        }
    }
    return nil;
}

- (NSString *)description
{
    return self.dayName;
}

@end
