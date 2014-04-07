//
//  TodayWorkoutTableViewCell.h
//  WorkoutLog
//
//  Created by Sharif on 4/6/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayWorkoutTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *workoutNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *workoutInfoLabel;
@property (weak, nonatomic) IBOutlet UIStepper *workoutStepper;
- (IBAction)stepperTapped:(id)sender;

@end
