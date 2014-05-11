//
//  WorkoutPlanEditViewController.h
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 4/24/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutPlan.h"
#import "WorkoutEditViewController.h"

@interface WorkoutPlanEditViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, copy) void (^dismissBlock)(void);

@property (strong, nonatomic) WorkoutPlan *workoutPlan;
@property (strong, nonatomic) NSMutableArray *tempWorkoutEntryTemplates;

@property (weak, nonatomic) IBOutlet UITextField *workoutPlanName;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *dayButtons;
@property (strong, nonatomic) NSMutableOrderedSet *selectedDayButtons;
@property (weak, nonatomic) WorkoutEditViewController *editViewController;

- (IBAction)clickedDayButton:(id)sender;

- (IBAction)save:(id)sender;
- (IBAction)addWorkout:(id)sender;

@end
