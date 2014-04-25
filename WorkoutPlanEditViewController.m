//
//  WorkoutPlanEditViewController.m
//  WorkoutLog
//
//  Created by Muhammad-Sharif Moustafa on 4/24/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutPlanEditViewController.h"
#import "WorkoutEntryTemplate.h"

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
        for (NSString *day in self.workoutPlan.days) {
            if ([button.currentTitle isEqualToString:[day substringToIndex:3]]) {
                button.backgroundColor = [UIColor colorWithRed:0.91 green:0.94 blue:0.98 alpha:1.0];
                [self.selectedDayButtons addObject:[day substringToIndex:3]];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:YES animated:animated];
}

- (IBAction)clickedDayButton:(id)sender {
    UIButton *button = (UIButton *)sender;
    if (button.backgroundColor == nil) {
        button.backgroundColor = [UIColor colorWithRed:0.91 green:0.94 blue:0.98 alpha:1.0];
        [self.selectedDayButtons addObject:button.currentTitle];
    } else {
        [self.selectedDayButtons removeObject:button.currentTitle];
        button.backgroundColor = nil;
    }
}

- (IBAction)save:(id)sender {
    if (![self.workoutPlanName.text isEqualToString:@""]) {
        self.workoutPlan.name = self.workoutPlanName.text;
    }
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (NSString *day in self.selectedDayButtons) {
        if ([day isEqualToString:@"Mon"]) {[temp addObject:@"Monday"];}
        else if ([day isEqualToString:@"Tue"]) {[temp addObject:@"Tuesday"];}
        else if ([day isEqualToString:@"Wed"]) {[temp addObject:@"Wednesday"];}
        else if ([day isEqualToString:@"Thu"]) {[temp addObject:@"Thursday"];}
        else if ([day isEqualToString:@"Fri"]) {[temp addObject:@"Friday"];}
        else if ([day isEqualToString:@"Sat"]) {[temp addObject:@"Saturday"];}
        else if ([day isEqualToString:@"Sun"]) {[temp addObject:@"Sunday"];}
    }
    self.workoutPlan.days = [NSMutableArray arrayWithArray:temp];
#warning For some reason, the presenting view controller doesn't refresh
    [self.presentingViewController dismissViewControllerAnimated:YES completion:self.dismissBlock];
}
@end
