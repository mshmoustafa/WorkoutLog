//
//  WorkoutLogViewController.m
//  WorkoutLog
//
//  Created by Sharif on 4/6/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutLogViewController.h"
#import "WorkoutDetailViewController.h"
#import "WorkoutLogStore.h"
#import "WorkoutsOnDate.h"

@interface WorkoutLogViewController ()

@end

@implementation WorkoutLogViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
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
    
    if (!self.workoutLogEntries) {
        self.workoutLogEntries = [[WorkoutLogStore sharedStore] allWorkoutEntriesByDate];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!self.workoutLogEntries) {
        self.workoutLogEntries = [[WorkoutLogStore sharedStore] allWorkoutEntriesByDate];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    return;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return self.workoutLogEntries.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    WorkoutsOnDate *workouts = [self.workoutLogEntries objectAtIndex:section];
    
    return workouts.workoutEntries.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    WorkoutsOnDate *workouts = [self.workoutLogEntries objectAtIndex:section];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    
    return [formatter stringFromDate: workouts.date];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"workoutlogcell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    WorkoutsOnDate *workouts = [self.workoutLogEntries objectAtIndex:indexPath.section];
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    //ERROR
    WorkoutEntry *workout = [workouts.workoutEntries objectAtIndex:indexPath.row];
    
    cell.textLabel.text = workout.name;
//    cell.textLabel.text = [[NSNumber numberWithInt:row] description];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    
    cell.detailTextLabel.text = [formatter stringFromDate:workout.date];
    
    return cell;
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
/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        WorkoutsOnDate *workouts = [self.workoutLogEntries objectAtIndex:indexPath.section];
        
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
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    WorkoutsOnDate *workouts = [self.workoutLogEntries objectAtIndex:indexPath.section];
    WorkoutEntry *workout = [workouts.workoutEntries objectAtIndex:indexPath.row];
    
    WorkoutDetailViewController *vc = [segue destinationViewController];
    
    vc.detailObject = workout;
    [vc shouldShowDateTitleAndLabel:YES];
    
    [vc setDismissBlock:^{
        self.workoutLogEntries = [[WorkoutLogStore sharedStore] allWorkoutEntriesByDate];
        [[self tableView] reloadData];
    }];
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)addWorkout:(id)sender {
    NSLog(@"Add button clicked");
    if (!self.workoutLogEntries) {
        self.workoutLogEntries = [[NSMutableArray alloc] init];
    }
    [self.workoutLogEntries addObject:[NSDate date]];
    [self.tableView reloadData];
}


@end
