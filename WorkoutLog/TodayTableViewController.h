//
//  TodayTableViewController.h
//  WorkoutLog
//
//  Created by Sharif on 4/6/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *workoutEntryTemplatesToday;
@property (strong, nonatomic) NSMutableArray *workoutEntriesToday;
@property (strong, nonatomic) NSMutableDictionary *selectedRows;
//@property (strong, nonatomic) NSMutableDictionary *completedCells;

//- (IBAction)onLongPress:(UILongPressGestureRecognizer *)sender;
//- (IBAction)edit:(id)sender;

@end
