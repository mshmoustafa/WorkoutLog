//
//  DateEditViewController.m
//  WorkoutLog
//
//  Created by Sharif Moustafa on 4/29/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "DateEditViewController.h"
#import "WorkoutLogStore.h"

@interface DateEditViewController ()

@end

@implementation DateEditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.datePicker.date = self.workout.date;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)done:(id)sender {
    
    self.workout.date = [WorkoutLogStore dateMidnight: self.datePicker.date];
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
