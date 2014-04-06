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

@property (strong, nonatomic) NSDate *testObject;

@property (strong, nonatomic) NSMutableArray *testArray;
@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;

@end
