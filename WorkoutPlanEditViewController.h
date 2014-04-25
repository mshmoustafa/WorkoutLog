//
//  WorkoutPlanEditViewController.h
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 4/24/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutPlan.h"

@interface WorkoutPlanEditViewController : UITableViewController

@property (nonatomic, copy) void (^dismissBlock)(void);

@property (strong, nonatomic) WorkoutPlan *workoutPlan;
@property (strong, nonatomic) NSMutableArray *tempWorkoutEntryTemplates;

@property (weak, nonatomic) IBOutlet UITextField *workoutPlanName;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *dayButtons;
@property (strong, nonatomic) NSMutableOrderedSet *selectedDayButtons;

- (IBAction)clickedDayButton:(id)sender;

- (IBAction)save:(id)sender;

@end
