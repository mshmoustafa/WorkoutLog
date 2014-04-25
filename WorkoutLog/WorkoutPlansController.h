//
//  WorkoutPlansController.h
//  WorkoutLog
//
//  Created by Sharif on 3/28/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkoutPlansController : UITableViewController

@property (strong, nonatomic) NSMutableArray *workoutPlans;

- (IBAction)addNewWorkoutPlan:(id)sender;

@end
