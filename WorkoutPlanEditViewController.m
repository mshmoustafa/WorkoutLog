//
//  WorkoutPlanEditViewController.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 4/24/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutPlanEditViewController.h"
#import "workoutEditViewController.h"
#import "WorkoutEntryTemplate.h"
#import "Day.h"

@interface WorkoutPlanEditViewController ()

@end

@implementation WorkoutPlanEditViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.selectedDayButtons = [[NSMutableOrderedSet alloc] init];
    
    self.workoutPlanName.text = self.workoutPlan.name;
    for (UIButton *button in self.dayButtons) {
        NSLog(@"%@", button.currentTitle);
        for (Day *day in self.workoutPlan.days) {
            if ([button.currentTitle isEqualToString:day.shortDay]) {
                button.backgroundColor = [UIColor colorWithRed:0.91 green:0.94 blue:0.98 alpha:1.0];
                [self.selectedDayButtons addObject:day];
            }
        }
    }
    
    [self setEditing:YES];
}

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
    return self.workoutPlan.workoutEntryTemplates.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"WorkoutEditCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = ((WorkoutEntryTemplate *)[self.workoutPlan.workoutEntryTemplates objectAtIndex:[indexPath row]]).name;
    
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    WorkoutEntryTemplate *selectedItem = [self.workoutPlan.workoutEntryTemplates objectAtIndex:indexPath.row];
    self.editViewController.workoutTemplate = selectedItem;
    [self.editViewController.view setNeedsDisplay];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.workoutPlan.workoutEntryTemplates removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

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
    if ([segue.identifier isEqualToString:@"EditWorkoutEntryTemplate"]) {
        
        UINavigationController *nav = (UINavigationController *)segue.destinationViewController;
        self.editViewController = (WorkoutEditViewController *)[nav.childViewControllers firstObject];
        [self.editViewController shouldShowDateButton:NO];
        
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        
//        WorkoutEntryTemplate *selectedItem = [self.workoutPlan.workoutEntryTemplates objectAtIndex:indexPath.row];
//        NSLog(@"selected item: %@", selectedItem.name);
//        ((WorkoutEditViewController *)segue.destinationViewController).workoutTemplate = selectedItem;
    }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:YES animated:animated];
}

- (IBAction)clickedDayButton:(id)sender {
    UIButton *button = (UIButton *)sender;
    if (button.backgroundColor == nil) {
        button.backgroundColor = [UIColor colorWithRed:0.91 green:0.94 blue:0.98 alpha:1.0];
        [self.selectedDayButtons addObject:[Day getDay:button.currentTitle]];
        [self.selectedDayButtons sortUsingComparator:^(Day *day1, Day *day2) {
            
            if (day1.dayNumber > day2.dayNumber) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            
            if (day1.dayNumber < day2.dayNumber) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
    } else {
        [self.selectedDayButtons removeObject:[Day getDay:button.currentTitle]];
        button.backgroundColor = nil;
    }
}

- (IBAction)save:(id)sender {
    if (![self.workoutPlanName.text isEqualToString:@""]) {
        self.workoutPlan.name = self.workoutPlanName.text;
    }
    NSMutableOrderedSet *temp = [[NSMutableOrderedSet alloc] init];
    for (Day *day in self.selectedDayButtons) {
        [temp addObject:day];
    }
    [temp sortUsingComparator:^(Day *day1, Day *day2) {
        
        if (day1.dayNumber > day2.dayNumber) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if (day1.dayNumber < day2.dayNumber) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    self.workoutPlan.days = temp;
#warning For some reason, the presenting view controller doesn't refresh
    [self.presentingViewController dismissViewControllerAnimated:YES completion:self.dismissBlock];
}

- (IBAction)addWorkout:(id)sender {
#warning This should use a generator in the template class so it can get a unique number as a name.
    WorkoutEntryTemplate *newWorkoutEntryTemplate = [[WorkoutEntryTemplate alloc] init];
    newWorkoutEntryTemplate.name = @"Hello";
    
    //    WorkoutEntryTemplate *newWorkoutEntryTemplate = [WorkoutEntryTemplate createNewWorkoutEntryTemplate];
    
    [self.workoutPlan.workoutEntryTemplates addObject:newWorkoutEntryTemplate];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.workoutPlan.workoutEntryTemplates.count - 1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self.view superview] resignFirstResponder];
    [self.view resignFirstResponder];
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}
@end
