//
//  WorkoutEditViewController.h
//  WorkoutLog
//
//  Created by Sharif on 4/25/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutEntryTemplate.h"

@interface WorkoutEditViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) WorkoutEntryTemplate *workoutTemplate;

@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *planLabel;
@property (weak, nonatomic) IBOutlet UITextField *repsLabel;
@property (weak, nonatomic) IBOutlet UIStepper *repsStepper;
@property (weak, nonatomic) IBOutlet UITextField *setsLabel;
@property (weak, nonatomic) IBOutlet UIStepper *setsStepper;
@property (weak, nonatomic) IBOutlet UITextField *weightLabel;
@property (weak, nonatomic) IBOutlet UIStepper *weightStepper;
@property (weak, nonatomic) IBOutlet UIPickerView *minutesPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *secondsPicker;

@property (nonatomic) NSUInteger selectedMinutes;
@property (nonatomic) NSUInteger selectedSeconds;

@property (strong, nonatomic) NSMutableArray *minutes;
@property (strong, nonatomic) NSMutableArray *seconds;

- (IBAction)repStepperChanged:(id)sender;
- (IBAction)setsStepperChanged:(id)sender;
- (IBAction)weightStepperChanged:(id)sender;

- (IBAction)done:(id)sender;

@end
