//
//  WorkoutEntryTemplate.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/23/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutEntryTemplate.h"

@implementation WorkoutEntryTemplate

#pragma mark - Initialization

- (id) init
{
    self = [super init];
#warning days array should never be nil
    self.days = nil;
    return self;
}

#pragma mark - Days

- (void)setDaysWithDays:(NSArray *)days
{
    
}

@end
