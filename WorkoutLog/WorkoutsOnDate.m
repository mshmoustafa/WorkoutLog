//
//  WorkoutsOnDate.m
//  WorkoutLog
//
//  Created by Sharif on 4/26/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutsOnDate.h"

@implementation WorkoutsOnDate

- (instancetype)init
{
    self = [super init];
    if (self) {
        if (!self.workoutEntries) {
            self.workoutEntries = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

@end
