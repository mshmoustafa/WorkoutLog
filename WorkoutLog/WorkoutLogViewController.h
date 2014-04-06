//
//  WorkoutLogViewController.h
//  WorkoutLog
//
//  Created by Sharif on 4/6/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkoutLogViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *testObjects;

- (IBAction)addWorkout:(id)sender;

@end
