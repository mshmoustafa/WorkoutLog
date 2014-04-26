//
//  WorkoutPlanTests.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/23/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WorkoutPlan.h"
#import "WorkoutEntryTemplate.h"
#import "Day.h"

@interface WorkoutPlanTests : XCTestCase

@end

@implementation WorkoutPlanTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//- (void)testExample
//{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
//}

#warning implement tests for name, days, and workout list

- (void)testworkoutEntryTemplates
{
    WorkoutPlan *weight = [[WorkoutPlan alloc] init];
    weight.name = @"Weights";
    weight.days = [NSMutableOrderedSet orderedSetWithArray:@[@1, @2]];
    
    WorkoutEntryTemplate *pushups = [[WorkoutEntryTemplate alloc] init];
    pushups.name = @"Push Ups";
    pushups.days = weight.days;
    pushups.reps = 10U;
    pushups.sets = 1U;
    pushups.min = 0;
    pushups.sec = 0;
    pushups.plan = weight.name;
    
    weight.workoutEntryTemplates = [NSMutableArray arrayWithArray:@[pushups]];
    XCTAssertEqual(weight.workoutEntryTemplates.count, 1U);
    XCTAssertEqualObjects(pushups.plan, weight.name);
    XCTAssertEqualObjects([weight.workoutEntryTemplates objectAtIndex:0U], pushups);
}

@end
