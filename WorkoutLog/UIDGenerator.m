//
//  UIDGenerator.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 5/20/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "UIDGenerator.h"

@implementation UIDGenerator

+ (NSString *)generateUID
{
    static char character = 'A';
    static short numChars = 1;
    
    static long lastTime = 0;
    long now = time(NULL);
    
    if (now != lastTime) {
        lastTime = now;
        character = 'A';
        numChars = 1;
        return [NSString stringWithFormat:@"%ld", now];
    }
    
    NSMutableString *appendedString = [[NSMutableString alloc] init];
    
    if (character == 'Z') {
        numChars++;
        character = 'A';
    }
    
    for (int i = 0; i < numChars; i++) {
        [appendedString appendFormat:@"%c", character];
    }
    
    character++;
    
    return [NSString stringWithFormat:@"%ld%@", now, appendedString];
}

@end
