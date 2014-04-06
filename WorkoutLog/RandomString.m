//
//  RandomString.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/23/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "RandomString.h"

@implementation RandomString

NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

+ (NSString *) genRandStringLength: (int) len {
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform(letters.length)]];
    }
    
    return randomString;
}

@end
