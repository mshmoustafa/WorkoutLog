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

@property (strong, nonatomic) NSString *dayName;
@property (strong, nonatomic) NSString *shortDay;
@property (strong, nonatomic) NSNumber *dayNumber;

+ (Day *)getDay:(NSString *)dayString;

@end
