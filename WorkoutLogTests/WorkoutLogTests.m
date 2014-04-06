//
//  WorkoutLogTests.m
//  WorkoutLogTests
//
//  Created by Muhammad-Sharif Moustafa on 2/21/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WorkoutEntry.h"

@interface WorkoutEntryTests : XCTestCase

@end

@implementation WorkoutEntryTests

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

#pragma mark - WorkoutEntry

- (void)testWorkoutEntryName
{
    NSString *name = @"Push ups";
    WorkoutEntry *pushups = [[WorkoutEntry alloc] init];
    pushups.name = name;
    XCTAssertEqual(pushups.name, name);
}

- (void)testWorkoutEntryNameNil
{
    //this isn't implemented in code yet
    WorkoutEntry *workout = [[WorkoutEntry alloc] init];
    workout.name = nil;
    XCTAssertNotNil(workout.name);
}

- (void)testWorkoutEntryDate
{
    WorkoutEntry *workout = [[WorkoutEntry alloc] init];
    //I can't get the NSDate's to be equal unless I check their descriptions
    XCTAssertEqualObjects(workout.date.description, [NSDate date].description);
}

- (void)testWorkoutEntryDateNil
{
    //not implemented yet
    WorkoutEntry *workout = [[WorkoutEntry alloc] init];
    workout.date = nil;
    XCTAssertNotNil(workout.date);
}

- (void)testWorkoutEntryReps
{
    WorkoutEntry *workout = [[WorkoutEntry alloc] init];
    NSUInteger reps = 10;
    workout.reps = reps;
    XCTAssertEqual(workout.reps, reps);
}

- (void)testWorkoutEntryRepsUnset
{
    WorkoutEntry *workout = [[WorkoutEntry alloc] init];
    NSUInteger zero = 0;
    XCTAssertEqual(workout.reps, zero);
}

- (void)testWorkoutEntrySets
{
    WorkoutEntry *workout = [[WorkoutEntry alloc] init];
    NSUInteger sets = 3;
    workout.sets = sets;
    XCTAssertEqual(workout.sets, sets);
}

- (void)testWorkoutEntrySetsUnset
{
    WorkoutEntry *workout = [[WorkoutEntry alloc] init];
    NSUInteger zero = 0;
    XCTAssertEqual(workout.sets, zero);
}

@end
