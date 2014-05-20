//
//  WorkoutPlanViewController.h
//  WorkoutLog
//
//  Created by Sharif on 3/28/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "WorkoutPlan.h"

@interface WorkoutPlanViewController : UITableViewController

//@property (strong, nonatomic) WorkoutPlan *workoutPlan;

@property (strong, nonatomic) WorkoutPlan *workoutPlan;

@property (strong, nonatomic) NSMutableArray *workoutEntryTemplates;
@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;

@property (weak, nonatomic) IBOutlet UILabel *daysLabel;
@property (weak, nonatomic) IBOutlet UIButton *addWorkoutButton;

- (IBAction)addWorkout:(id)sender;

@end
