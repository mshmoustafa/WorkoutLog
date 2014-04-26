//
//  WorkoutDetailViewController.h
//  WorkoutLog
//
//  Created by Sharif on 3/28/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutEntryTemplate.h"

@interface WorkoutDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (strong, nonatomic) WorkoutEntryTemplate *detailObject;
@property (weak, nonatomic) IBOutlet UILabel *planName;
@property (weak, nonatomic) IBOutlet UILabel *repsLabel;
@property (weak, nonatomic) IBOutlet UILabel *setsLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *minutesLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondsLabel;




- (IBAction)done:(id)sender;
- (IBAction)save:(id)sender;

@end
