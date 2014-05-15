//
//  WorkoutEditViewController.h
//  WorkoutLog
//
//  Created by Sharif on 4/25/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StaticDataTableViewController/StaticDataTableViewController.h"
#import "WorkoutEntryTemplate.h"

@interface WorkoutEditViewController : StaticDataTableViewController <UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
{
    BOOL shouldShowDateCell;
}

//Changed this property from WorkoutEntryTemplate to WorkoutEntry
//so that this view controller can accept both templates and entries.
@property (weak, nonatomic) WorkoutEntry *workoutTemplate;

@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *typeSegmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *planLabel;
@property (weak, nonatomic) IBOutlet UITextField *repsLabel;
@property (weak, nonatomic) IBOutlet UIStepper *repsStepper;
@property (weak, nonatomic) IBOutlet UITextField *setsLabel;
@property (weak, nonatomic) IBOutlet UIStepper *setsStepper;
@property (weak, nonatomic) IBOutlet UITextField *weightLabel;
@property (weak, nonatomic) IBOutlet UIStepper *weightStepper;
@property (weak, nonatomic) IBOutlet UIPickerView *minutesPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *secondsPicker;

//@property (weak, nonatomic) IBOutlet UIButton *dateButton;
@property (weak, nonatomic) IBOutlet UITableViewCell *dateCell;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UITableViewCell *repsCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *setsCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *weightCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *timeCell;


@property (nonatomic) NSUInteger selectedMinutes;
@property (nonatomic) NSUInteger selectedSeconds;

@property (strong, nonatomic) NSMutableArray *minutes;
@property (strong, nonatomic) NSMutableArray *seconds;

- (void)shouldShowDateButton:(BOOL)yesOrNo;

- (IBAction)typeSegmentedControlChanged:(UISegmentedControl *)sender;
- (IBAction)repStepperChanged:(id)sender;
- (IBAction)setsStepperChanged:(id)sender;
- (IBAction)weightStepperChanged:(id)sender;
- (IBAction)dateButtonClicked:(UIButton *)button;

- (IBAction)done:(id)sender;

@end
