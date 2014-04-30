//
//  WorkoutLogDetailViewController.h
//  WorkoutLog
//
//  Created by Sharif on 4/6/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutEntry.h"

@interface WorkoutLogDetailViewController : UIViewController

@property (strong, nonatomic) WorkoutEntry *workout;

@property (weak, nonatomic) IBOutlet UITextField *workoutName;

- (IBAction)cancel:(id)sender;

@end
