//
//  Day.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 4/25/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "Day.h"

@implementation Day

+ (Day *)getDay:(NSString *)dayString
{
    Day *day = [[Day alloc] init];
    if ([dayString isEqualToString:@"Sunday"]) {
        day.dayName = dayString;
        day.shortDay = [dayString substringToIndex:3];
        day.dayNumber = @1;
    } else if ([dayString isEqualToString:@"Monday"]) {
        day.dayName = dayString;
        day.shortDay = [dayString substringToIndex:3];
        day.dayNumber = @2;
    } else if ([dayString isEqualToString:@"Tuesday"]) {
        day.dayName = dayString;
        day.shortDay = [dayString substringToIndex:3];
        day.dayNumber = @3;
    } else if ([dayString isEqualToString:@"Wednesday"]) {
        day.dayName = dayString;
        day.shortDay = [dayString substringToIndex:3];
        day.dayNumber = @4;
    } else if ([dayString isEqualToString:@"Thursday"]) {
        day.dayName = dayString;
        day.shortDay = [dayString substringToIndex:3];
        day.dayNumber = @5;
    } else if ([dayString isEqualToString:@"Friday"]) {
        day.dayName = dayString;
        day.shortDay = [dayString substringToIndex:3];
        day.dayNumber = @6;
    } else if ([dayString isEqualToString:@"Saturday"]) {
        day.dayName = dayString;
        day.shortDay = [dayString substringToIndex:3];
        day.dayNumber = @7;
    }
    return day;
}

@end
