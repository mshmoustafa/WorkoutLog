//
//  WorkoutEntry.h
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/21/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkoutEntry : NSObject

@property (strong, nonatomic) NSNumber *UID;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSString *plan;

@property (nonatomic) NSUInteger reps;
@property (nonatomic) NSUInteger sets;
@property (nonatomic) NSUInteger weight;
@property (nonatomic) NSUInteger min;
@property (nonatomic) NSUInteger sec;

+ (WorkoutEntry *)createNewWorkout;

@end
