//
//  Day.h
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 4/25/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Day : NSObject
{
    
}

@property (copy, nonatomic) NSString *dayName;
@property (copy, nonatomic) NSString *shortDay;
@property (copy, nonatomic) NSNumber *dayNumber;

+ (Day *)getDay:(NSString *)dayString;

@end
