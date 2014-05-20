//
//  WorkoutPlanViewController.m
//  WorkoutLog
//
//  Created by Sharif on 3/28/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutLogStore.h"
#import "WorkoutPlanViewController.h"
#import "WorkoutDetailViewController.h"
#import "WorkoutPlanEditViewController.h"
#import "WorkoutEntryTemplate.h"
#import "Day.h"

@interface WorkoutPlanViewController ()

@end

@implementation WorkoutPlanViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)fillDaysLabel
{
    self.daysLabel.text = @"";
    for (Day *day in self.workoutPlan.days) {
        self.daysLabel.text = [self.daysLabel.text stringByAppendingString:day.shortDay];
        self.daysLabel.text = [self.daysLabel.text stringByAppendingString:@" "];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //    self.navigationController.navigationBar.topItem.title = _testObject.description;
    //    self.navigationController.navigationItem.title = _testObject.description;
    self.navBar.title = _workoutPlan.description;
    if (!_workoutEntryTemplates) {
        _workoutEntryTemplates = self.workoutPlan.workoutEntryTemplates;
    }
    
    //    for (int i = 0; i < 3; i++) {
    //        [self.workoutEntries addObject:[NSNumber numberWithInt:i]];
    //    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
    self.navBar.title = self.workoutPlan.description;
    [self fillDaysLabel];
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:YES];
//    [self.tableView reloadData];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _workoutEntryTemplates.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"WorkoutPlanCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    WorkoutEntryTemplate *workoutEntryTemplate = [_workoutEntryTemplates objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [workoutEntryTemplate description];
    cell.detailTextLabel.text = [workoutEntryTemplate getInfoByType];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

// Override to support editing the table view.
/*
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"workoutDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        WorkoutEntryTemplate *selectedItem = [self.workoutEntryTemplates objectAtIndex:indexPath.row];
        WorkoutDetailViewController *vc = (WorkoutDetailViewController *)segue.destinationViewController;
        vc.workoutEntry = selectedItem;
        [vc shouldShowDateTitleAndLabel:NO];
    } else if ([segue.identifier isEqualToString:@"EditWorkoutPlan"]) {
        WorkoutPlanEditViewController *vc = ((WorkoutPlanEditViewController *)segue.destinationViewController);
        vc.workoutPlan = self.workoutPlan;
        [vc setDismissBlock:^{
            [[self tableView] reloadData];
        }];
    }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    //    if (self.addWorkoutButton.isHidden) {
    //        [UIView transitionWithView:self.addWorkoutButton
    //                          duration:0.4
    //                           options:UIViewAnimationOptionTransitionCrossDissolve
    //                        animations:NULL
    //                        completion:NULL];
    //        [self.addWorkoutButton setHidden:NO];
    //    }
    //    else {
    //        [UIView transitionWithView:self.addWorkoutButton
    //                          duration:0.4
    //                           options:UIViewAnimationOptionTransitionCrossDissolve
    //                        animations:NULL
    //                        completion:NULL];
    //        [self.addWorkoutButton setHidden:YES];
    //    }
}

- (IBAction)editClicked:(id)sender {
    [self setEditing:!self.isEditing animated:YES];
}

- (IBAction)addWorkout:(id)sender {
#warning This should use a generator in the template class so it can get a unique number as a name.
    WorkoutEntryTemplate *newWorkoutEntryTemplate = [WorkoutEntryTemplate createNewWorkoutEntryTemplateWithPlan:self.workoutPlan.name];
//    newWorkoutEntryTemplate.name = @"Hello";
    
    //    WorkoutEntryTemplate *newWorkoutEntryTemplate = [WorkoutEntryTemplate createNewWorkoutEntryTemplate];
    
    [[WorkoutLogStore sharedStore] addWorkoutEntryTemplate:newWorkoutEntryTemplate toPlan:self.workoutPlan];
    
//    [self.workoutPlan.workoutEntryTemplates addObject:newWorkoutEntryTemplate];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.workoutPlan.workoutEntryTemplates.count - 1 inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end
