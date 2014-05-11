//
//  WorkoutDetailViewController.h
//  WorkoutLog
//
//  Created by Sharif on 3/28/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutEntry.h"

@interface WorkoutDetailViewController : UITableViewController
{
    BOOL shouldShowDateTitleAndLabel;
}

@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;

@property (nonatomic, copy) void (^dismissBlock)(void);

//Changed this property from WorkoutEntryTemplate to WorkoutEntry
//so that this view controller can accept both templates and entries.
@property (strong, nonatomic) WorkoutEntry *workoutEntry;

@property (weak, nonatomic) IBOutlet UILabel *planName;
@property (weak, nonatomic) IBOutlet UILabel *repsLabel;
@property (weak, nonatomic) IBOutlet UILabel *setsLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *minutesLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondsLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateTitle;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


- (void)shouldShowDateTitleAndLabel:(BOOL)yesOrNo;

- (IBAction)done:(id)sender;
- (IBAction)save:(id)sender;

@end
