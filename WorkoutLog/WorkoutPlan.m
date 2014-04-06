//
//  WorkoutPlan.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/23/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutPlan.h"

@implementation WorkoutPlan

- (id)init
{
    self = [super init];
    if (self) {
        self.name = nil;
        self.days = nil;
        self.workoutList = nil;
    }
    return self;
}

#warning make methods to create new workouts

@end
