//
//  WorkoutDetailViewController.m
//  WorkoutLog
//
//  Created by Sharif on 3/28/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutDetailViewController.h"
#import "WorkoutEditViewController.h"

@interface WorkoutDetailViewController ()

@end

@implementation WorkoutDetailViewController

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
    self.navBar.title = [_detailObject name];
    self.planName.text = self.detailObject.plan;
#warning *aesthetic: don't show fields that aren't set
    self.repsLabel.text = [[NSNumber numberWithInt:self.detailObject.reps] stringValue];
    self.setsLabel.text = [[NSNumber numberWithInt:self.detailObject.sets] stringValue];
    self.minutesLabel.text = [[NSNumber numberWithInt:self.detailObject.min] stringValue];
    self.secondsLabel.text = [[NSNumber numberWithInt:self.detailObject.sec] stringValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"EditWorkoutEntryTemplate"]) {
        ((WorkoutEditViewController *)segue.destinationViewController).workoutTemplate = self.detailObject;
    }
}

- (IBAction)done:(id)sender {
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}
@end
