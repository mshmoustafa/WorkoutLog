//
//  TodayTableViewController.m
//  WorkoutLog
//
//  Created by Sharif on 4/6/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "TodayTableViewController.h"
#import "TodayWorkoutTableViewCell.h"
#import "WorkoutEditViewController.h"
#import "WorkoutLogStore.h"

@interface TodayTableViewController ()

@end

@implementation TodayTableViewController

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
    
    if (!self.workoutsToday) {
        self.workoutsToday = [[NSMutableArray alloc] init];
    }
    for (int i = 0; i < 5; i++) {
        [self.workoutsToday addObject:[NSNumber numberWithInt:i]];
    }
    
    //    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongPress:)];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.workoutsToday.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"todayworkoutcell";
    
    TodayWorkoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.workoutNameLabel.text = [[NSDate date] description];
    
    cell.workoutInfoLabel.text = @"Do lots of reps!";
    
    NSNumber *key = [NSNumber numberWithInt:indexPath.row];
    if ([[self.completedWorkouts allKeys] containsObject:key]) {
        
        cell.backgroundColor = [UIColor yellowColor];
        
        //        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:@"Your String here"];
        //        [attributeString addAttribute:NSStrikethroughStyleAttributeName
        //                                value:@2
        //                                range:NSMakeRange(0, [attributeString length])];
    } else {
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    cell.editButton.tag = indexPath.row;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *key = [NSNumber numberWithInt:indexPath.row];
    WorkoutEntry *workout = [self.completedWorkouts valueForKey:[key stringValue]];
    if (workout) {
        [self.completedWorkouts removeObjectForKey:[key stringValue]];
        [[[WorkoutLogStore sharedStore] allWorkoutEntries] removeObject:workout];
        //unstrikethrough text
    } else {
        WorkoutEntryTemplate *template = [self.workoutsToday objectAtIndex:indexPath.row];
        if (template) {
            workout = [template makeWorkoutEntryFromTemplate];
            [[[WorkoutLogStore sharedStore] allWorkoutEntries] addObject:workout];
            [self.completedWorkouts setValue:workout forKey:[key stringValue]];
        }

        //strikethrough text
    }
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
    
    
    
    
    
    
    
    //    UITableViewCell *cell = [self tableView:self.tableView cellForRowAtIndexPath:indexPath];
    //    if ([self.selectedRows containsObject:cell]) {
    //        [self.selectedRows removeObject:cell];
    //    }
    //
    //
    //
    //    NSNumber *key = [NSNumber numberWithInt:indexPath.row];
    //    NSNumber *wasSelectedBeforeAsNumber = [self.completedWorkouts valueForKey:[key stringValue]];
    //    BOOL wasSelectedBefore = [wasSelectedBeforeAsNumber boolValue];
    //
    //    if (!wasSelectedBefore) {
    //        self.completedw
    //    }
    return;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
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
    UIButton *editButton = (UIButton *)sender;
    NSLog(@"Edit button clicked on row: %d", editButton.tag);
    
    WorkoutEditViewController *vc = segue.destinationViewController;
    vc.workoutTemplate = [self.workoutsToday objectAtIndex:editButton.tag];
    [vc shouldShowDateButton:NO];
}

//- (IBAction)onLongPress:(UILongPressGestureRecognizer *)sender {
//    if (sender.state == UIGestureRecognizerStateEnded)
//    {
//        UITableView* tableView = (UITableView*)self.view;
//        CGPoint touchPoint = [sender locationInView:self.view];
//        NSIndexPath* row = [tableView indexPathForRowAtPoint:touchPoint];
//        if (row != nil) {
//            NSLog(@"Row selected: %d", row.row);
//        }
//    }
//}

- (IBAction)editWorkout:(id)sender {
}
- (IBAction)edit:(id)sender {
}
@end
