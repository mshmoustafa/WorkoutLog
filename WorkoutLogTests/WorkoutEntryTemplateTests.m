//
//  WorkoutEntryTemplateTests.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 2/23/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WorkoutEntryTemplate.h"

@interface WorkoutEntryTemplateTests : XCTestCase

@end

@implementation WorkoutEntryTemplateTests

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

#pragma mark - WorkoutEntryTemplate

- (void)testWorkoutEntryTemplateName
{
    NSString *name = @"Push ups";
    WorkoutEntryTemplate *pushups = [[WorkoutEntryTemplate alloc] init];
    pushups.name = name;
    XCTAssertEqual(pushups.name, name);
}

- (void)testWorkoutEntryTemplateNameNil
{
    //this isn't implemented in code yet
    WorkoutEntryTemplate *workout = [[WorkoutEntryTemplate alloc] init];
    workout.name = nil;
    XCTAssertNotNil(workout.name);
}

- (void)testWorkoutEntryTemplateDate
{
    WorkoutEntryTemplate *workout = [[WorkoutEntryTemplate alloc] init];
    //I can't get the NSDate's to be equal unless I check their descriptions
    XCTAssertEqualObjects(workout.date.description, [NSDate date].description);
}

- (void)testWorkoutEntryTemplateDateNil
{
    //not implemented yet
    WorkoutEntryTemplate *workout = [[WorkoutEntryTemplate alloc] init];
    workout.date = nil;
    XCTAssertNotNil(workout.date);
}

- (void)testWorkoutEntryTemplateReps
{
    WorkoutEntryTemplate *workout = [[WorkoutEntryTemplate alloc] init];
    NSUInteger reps = 10;
    workout.reps = reps;
    XCTAssertEqual(workout.reps, reps);
}

- (void)testWorkoutEntryTemplateRepsUnset
{
    WorkoutEntryTemplate *workout = [[WorkoutEntryTemplate alloc] init];
    NSUInteger zero = 0;
    XCTAssertEqual(workout.reps, zero);
}

- (void)testWorkoutEntryTemplateSets
{
    WorkoutEntryTemplate *workout = [[WorkoutEntryTemplate alloc] init];
    NSUInteger sets = 3;
    workout.sets = sets;
    XCTAssertEqual(workout.sets, sets);
}

- (void)testWorkoutEntryTemplateSetsUnset
{
    WorkoutEntryTemplate *workout = [[WorkoutEntryTemplate alloc] init];
    NSUInteger zero = 0;
    XCTAssertEqual(workout.sets, zero);
}

- (void)testWorkoutEntryTemplateDays
{
    WorkoutEntryTemplate *workoutEntryTemplate = [[WorkoutEntryTemplate alloc] init];
    NSArray *days = @[[NSNumber numberWithInt:MON]];
    workoutEntryTemplate.days = @[[NSNumber numberWithInt:MON]];
    XCTAssertEqualObjects(workoutEntryTemplate.days, days);
}

- (void)testWorkoutEntryTemplateDaysOutOfBounds
{
    //not implemented yet
    WorkoutEntryTemplate *workoutEntryTemplate = [[WorkoutEntryTemplate alloc] init];
    workoutEntryTemplate.days = nil;
    XCTAssertNotNil(workoutEntryTemplate.days);
}

@end
