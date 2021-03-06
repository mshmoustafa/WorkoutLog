//
//  WorkoutPlansController.m
//  WorkoutLog
//
//  Created by Sharif on 3/28/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutPlansController.h"
#import "WorkoutPlanViewController.h"
#import "WorkoutLogStore.h"

@interface WorkoutPlansController ()

@end

@implementation WorkoutPlansController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        //        if (!_testObjects) {
        //            _testObjects = [[WorkoutLogStore sharedStore] allWorkoutPlans];
        //        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    if (!_workoutPlans) {
        _workoutPlans = [[WorkoutLogStore sharedStore] allWorkoutPlans];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    [self.tableView reloadData];
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
    NSLog(@"%lu", (unsigned long)_workoutPlans.count);
    return _workoutPlans.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"WorkoutPlansCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [[_workoutPlans objectAtIndex:indexPath.row] description];
    
    return cell;
}


 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
        NSLog(@"%ld, rows = %lu", indexPath.row, (unsigned long)_workoutPlans.count);
        // Delete the row from the data source
        
        [[[WorkoutLogStore sharedStore] allWorkoutPlans] removeObjectAtIndex:indexPath.row];
        [[WorkoutLogStore sharedStore] saveData];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
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
    if ([segue.identifier isEqualToString:@"workoutPlan"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        WorkoutPlan *selectedItem = [self.workoutPlans objectAtIndex:indexPath.row];
        ((WorkoutPlanViewController *)segue.destinationViewController).workoutPlan = selectedItem;
    }
}


- (IBAction)addNewWorkoutPlan:(id)sender {
    if (!_workoutPlans) {
        _workoutPlans = [[WorkoutLogStore sharedStore] allWorkoutPlans];
    }
    WorkoutPlan *newPlan = [WorkoutPlan createNewPlan];
    [_workoutPlans addObject:newPlan];
    
    [[WorkoutLogStore sharedStore] saveData];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(_workoutPlans.count - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end
