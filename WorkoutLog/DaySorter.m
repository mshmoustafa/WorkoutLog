//
//  DaySorter.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 4/25/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "DaySorter.h"

@implementation DaySorter

+ (NSMutableArray *)sortDaysArray:(NSMutableArray *)days
{
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (NSString *day in days) {
        NSString *stringCopy = [NSString stringWithString:day];
        [temp addObject:stringCopy];
    }
    [DaySorter convertDaysToNumbers:temp];
    [temp sortUsingComparator:^(id obj1, id obj2) {
        
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    return days;
}

+ (NSMutableArray *)convertDaysToNumbers:(NSMutableArray *)days
{
    [days removeAllObjects];
    NSMutableArray *numberedDays = days;
    for (NSString *day in days) {
        if ([day isEqualToString:@"Sunday"]) {
            [numberedDays addObject:@1];
        } else if ([day isEqualToString:@"Monday"]) {
            [numberedDays addObject:@2];
        } else if ([day isEqualToString:@"Tuesday"]) {
            [numberedDays addObject:@3];
        } else if ([day isEqualToString:@"Wednesday"]) {
            [numberedDays addObject:@4];
        } else if ([day isEqualToString:@"Thursday"]) {
            [numberedDays addObject:@5];
        } else if ([day isEqualToString:@"Friday"]) {
            [numberedDays addObject:@6];
        } else if ([day isEqualToString:@"Saturday"]) {
            [numberedDays addObject:@7];
        }
    }
    return days;
}

+ (NSMutableArray *)convertNumbersToDays:(NSMutableArray *)numbers
{
    [numbers removeAllObjects];
    for (NSString *day in days) {
        if ([day isEqualToString:@"Sunday"]) {
            [numberedDays addObject:@1];
        } else if ([day isEqualToString:@"Monday"]) {
            [numberedDays addObject:@2];
        } else if ([day isEqualToString:@"Tuesday"]) {
            [numberedDays addObject:@3];
        } else if ([day isEqualToString:@"Wednesday"]) {
            [numberedDays addObject:@4];
        } else if ([day isEqualToString:@"Thursday"]) {
            [numberedDays addObject:@5];
        } else if ([day isEqualToString:@"Friday"]) {
            [numberedDays addObject:@6];
        } else if ([day isEqualToString:@"Saturday"]) {
            [numberedDays addObject:@7];
        }
    }
    return numbers;
}

@end
