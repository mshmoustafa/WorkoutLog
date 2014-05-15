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

- (void)initializeFields
{
    
    [self reloadDataAnimated:NO];
    
    self.hideSectionsWithHiddenRows = YES;
    
    [self cell:self.dateCell setHidden:!shouldShowDateCell];
    
    if ([self.workoutEntry.type isEqualToString:WORKOUT_TYPE_CARDIO]) {
        
        BOOL hidden = YES;
        
        [self cell:self.minutesCell setHidden:!hidden];
        [self cell:self.secondsCell setHidden:!hidden];
        
        [self cell:self.repsCell setHidden:hidden];
        [self cell:self.setsCell setHidden:hidden];
        [self cell:self.weightCell setHidden:hidden];
        
    } else if ([self.workoutEntry.type isEqualToString:WORKOUT_TYPE_WEIGHT]) {
        
        BOOL hidden = NO;
        
        [self cell:self.minutesCell setHidden:!hidden];
        [self cell:self.secondsCell setHidden:!hidden];
        
        [self cell:self.repsCell setHidden:hidden];
        [self cell:self.setsCell setHidden:hidden];
        [self cell:self.weightCell setHidden:hidden];
        
    }
    
    [self reloadDataAnimated:NO];
    
    self.navBar.title = [_workoutEntry name];
    self.typeLabel.text = self.workoutEntry.type;
    self.planName.text = self.workoutEntry.plan;
#warning *aesthetic: don't show fields that aren't set
    self.repsLabel.text = [[NSNumber numberWithLong:self.workoutEntry.reps] stringValue];
    self.setsLabel.text = [[NSNumber numberWithLong:self.workoutEntry.sets] stringValue];
    self.weightLabel.text = [[NSNumber numberWithLong:self.workoutEntry.weight] stringValue];
    self.minutesLabel.text = [[NSNumber numberWithLong:self.workoutEntry.min] stringValue];
    self.secondsLabel.text = [[NSNumber numberWithLong:self.workoutEntry.sec] stringValue];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    
    self.dateLabel.text = [formatter stringFromDate:self.workoutEntry.date];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = self.workoutEntry.name;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self initializeFields];
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
        ((WorkoutEditViewController *)[nav.childViewControllers firstObject]).workoutTemplate = self.workoutEntry;
        
        [((WorkoutEditViewController *)[nav.childViewControllers firstObject]) shouldShowDateButton:shouldShowDateCell];
    }
}

- (void)shouldShowDateTitleAndLabel:(BOOL)yesOrNo
{
    shouldShowDateCell = yesOrNo;
}

- (IBAction)done:(id)sender {
    //    [[self presentingViewController] dismissViewControllerAnimated:YES completion:self.dismissBlock];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
