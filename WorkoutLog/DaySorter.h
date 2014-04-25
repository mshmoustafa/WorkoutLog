//
//  DaySorter.h
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 4/25/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DaySorter : NSObject

+ (NSMutableArray *)sortDaysArray:(NSMutableArray *)days;
+ (NSMutableOrderedSet *)sortDaysOrderedSet:(NSMutableOrderedSet *)days;

+ (NSMutableArray *)convertDaysToNumbers:(NSMutableArray *)days;

@end
