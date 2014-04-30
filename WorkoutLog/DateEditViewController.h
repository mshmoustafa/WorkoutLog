//
//  DateEditViewController.h
//  WorkoutLog
//
//  Created by Sharif Moustafa on 4/29/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutEntryTemplate.h"

@interface DateEditViewController : UIViewController

@property (strong, nonatomic) WorkoutEntryTemplate *workout;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)done:(id)sender;

@end
