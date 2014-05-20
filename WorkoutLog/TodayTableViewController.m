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

@property (strong, nonatomic) NSDate *dateOpened;

@end

@implementation TodayTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)initializeWorkoutEntryTemplates
{
    self.dateOpened = [WorkoutLogStore dateMidnight:[NSDate date]];
    
    self.workoutEntryTemplatesToday = [[WorkoutLogStore sharedStore] todayWorkoutEntryTemplates];
    self.workoutEntriesToday = [[WorkoutLogStore sharedStore] todayWorkoutEntries];
    if (!self.workoutEntryTemplatesToday) {
        self.workoutEntryTemplatesToday = [[NSMutableArray alloc] init];
    }
    if (!self.workoutEntriesToday) {
        self.workoutEntriesToday = [[NSMutableArray alloc] init];
    }
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!self.completedWorkoutEntryTemplates) {
        self.completedWorkoutEntryTemplates = [[NSMutableArray alloc] init];
    }
    
//        NSNumber *negativeKey = @-1;
//        for (WorkoutEntry *workoutEntry in [[WorkoutLogStore sharedStore] todayWorkoutEntries]) {
//            [self.completedWorkouts setValue:workoutEntry forKey:[negativeKey stringValue]];
//            negativeKey = [NSNumber numberWithLong:[negativeKey longValue] - 1];
//        }
        
    }
//    for (int i = 0; i < 5; i++) {
//        [self.workoutsToday addObject:[NSNumber numberWithInt:i]];
//    }
    
    //    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongPress:)];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self initializeWorkoutEntryTemplates];
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
    return self.workoutEntryTemplatesToday.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"todayworkoutcell";
    
    TodayWorkoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    WorkoutEntryTemplate *workoutEntryTemplate = [self.workoutEntryTemplatesToday objectAtIndex:indexPath.row];
    
//    NSNumber *key = [NSNumber numberWithLong:indexPath.row];
//    NSArray *allKeys = [self.completedWorkouts allKeys];
    
    NSMutableAttributedString *nameLabelText = [[NSMutableAttributedString alloc] initWithString:workoutEntryTemplate.name];
    NSMutableAttributedString *detailText = [[NSMutableAttributedString alloc] initWithString:[workoutEntryTemplate getInfoByType]];
    
//    BOOL workoutEntryMatchesTemplate = NO;
//    for (WorkoutEntry *workoutEntry in self.workoutEntriesToday) {
//        if ([workoutEntry.name isEqualToString:workoutEntryTemplate.name]) {
//            workoutEntryMatchesTemplate = YES;
//            break;
//        }
//    }
    
    if ([self workoutEntryMatchesTemplate:workoutEntryTemplate]) {
        
        cell.isCompleted = YES;
        
//        [self.completedWorkoutEntryTemplates addObject:workoutEntryTemplate.UID];
        
        cell.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.0];
        
        [nameLabelText addAttribute:NSStrikethroughStyleAttributeName
                              value:@2
                              range:NSMakeRange(0, [nameLabelText length])];
        
        [detailText addAttribute:NSStrikethroughStyleAttributeName
                              value:@2
                              range:NSMakeRange(0, [detailText length])];
        
        //        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:@"Your String here"];
        //        [attributeString addAttribute:NSStrikethroughStyleAttributeName
        //                                value:@2
        //                                range:NSMakeRange(0, [attributeString length])];
        
    } else {
        
        cell.isCompleted = NO;
        
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    cell.workoutNameLabel.attributedText = nameLabelText;
    
    cell.workoutInfoLabel.attributedText = detailText;
    
    cell.editButton.tag = indexPath.row;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSNumber *key = [NSNumber numberWithLong:indexPath.row];
//    WorkoutEntry *workout = [self.completedWorkouts valueForKey:[key stringValue]];
    
    NSLog(self.dateOpened.description);
    NSLog([WorkoutLogStore dateMidnight:[NSDate date]].description);
    
    //if the date that this view was last updated was not today, update it. This is to prevent bugs when this view is opened close to midnight and the next day begins.
    if (![self.dateOpened isEqualToDate:[WorkoutLogStore dateMidnight:[NSDate date]]]) {
        [self initializeWorkoutEntryTemplates];
        return;
    }

    WorkoutEntryTemplate *workoutEntryTemplate = [self.workoutEntryTemplatesToday objectAtIndex:indexPath.row];
    
//    BOOL workoutEntryMatchesTemplate = NO;
    WorkoutEntry *matchedWorkoutEntry = nil;
//    for (WorkoutEntry *workoutEntry in self.workoutEntriesToday) {
//        if ([workoutEntry.name isEqualToString:workoutEntryTemplate.name]) {
//            workoutEntryMatchesTemplate = YES;
//            matchedWorkoutEntry = workoutEntry;
//            break;
//        }
//    }
    
    //if workout entry template is found, delete it from completed workouts
    if ((matchedWorkoutEntry = [self workoutEntryMatchesTemplate:workoutEntryTemplate])) {
//        [self.completedWorkouts removeObjectForKey:[key stringValue]];
        
        WorkoutLogStore *store = [WorkoutLogStore sharedStore];
        
        [[WorkoutLogStore sharedStore] deleteWorkoutEntry:matchedWorkoutEntry];
        
//        self.workoutEntriesToday = [[WorkoutLogStore sharedStore] todayWorkoutEntries];
        
    } else {
        
//        [self.completedWorkoutEntryTemplates addObject:workoutEntryTemplate.UID];
        
//        WorkoutEntryTemplate *template = [self.workoutEntryTemplatesToday objectAtIndex:indexPath.row];
//        if (template) {
            WorkoutEntry *workout = [workoutEntryTemplate makeWorkoutEntryFromTemplate];
//            workout.date = [WorkoutLogStore dateMidnight:workout.date];
        
            WorkoutLogStore *store = [WorkoutLogStore sharedStore];
        
            [[WorkoutLogStore sharedStore] addWorkoutEntry:workout];
        
//        self.workoutEntriesToday = [[WorkoutLogStore sharedStore] todayWorkoutEntries];
        
//        }

    }
    
    self.workoutEntriesToday = [[WorkoutLogStore sharedStore] todayWorkoutEntries];
    
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
    NSLog(@"Edit button clicked on row: %ld", (long)editButton.tag);
    
    WorkoutEditViewController *vc = segue.destinationViewController;
    vc.workoutTemplate = [self.workoutEntryTemplatesToday objectAtIndex:editButton.tag];
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

- (WorkoutEntry *)workoutEntryMatchesTemplate:(WorkoutEntryTemplate *)workoutEntryTemplate
{
    for (WorkoutEntry *workoutEntry in self.workoutEntriesToday) {
        if ([workoutEntry.name isEqualToString:workoutEntryTemplate.name] && [workoutEntry.workoutEntryTemplateUID isEqualToNumber:workoutEntryTemplate.UID]) {
            return workoutEntry;
        }
    }
    return nil;
}

- (IBAction)editWorkout:(id)sender {
}
- (IBAction)edit:(id)sender {
}
@end
