//
//  WorkoutsOnDate.h
//  WorkoutLog
//
//  Created by Sharif on 4/26/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkoutsOnDate : NSObject

@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSMutableArray *workoutEntries;

@end
