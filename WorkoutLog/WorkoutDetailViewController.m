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
    
    if (shouldShowDateTitleAndLabel) {
        self.dateTitle.hidden = NO;
        self.dateLabel.hidden = NO;
    }
    
    self.navBar.title = [_detailObject name];
    self.planName.text = self.detailObject.plan;
#warning *aesthetic: don't show fields that aren't set
    self.repsLabel.text = [[NSNumber numberWithLong:self.detailObject.reps] stringValue];
    self.setsLabel.text = [[NSNumber numberWithLong:self.detailObject.sets] stringValue];
    self.weightLabel.text = [[NSNumber numberWithLong:self.detailObject.weight] stringValue];
    self.minutesLabel.text = [[NSNumber numberWithLong:self.detailObject.min] stringValue];
    self.secondsLabel.text = [[NSNumber numberWithLong:self.detailObject.sec] stringValue];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    
    self.dateLabel.text = [formatter stringFromDate:self.detailObject.date];
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
        UINavigationController *nav = (UINavigationController *)segue.destinationViewController;
        ((WorkoutEditViewController *)[nav.childViewControllers firstObject]).workoutTemplate = self.detailObject;
        
        [((WorkoutEditViewController *)[nav.childViewControllers firstObject]) shouldShowDateButton:shouldShowDateTitleAndLabel];
    }
}

- (void)shouldShowDateTitleAndLabel:(BOOL)yesOrNo
{
    shouldShowDateTitleAndLabel = yesOrNo;
}

- (IBAction)done:(id)sender {
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:self.dismissBlock];
}
@end
