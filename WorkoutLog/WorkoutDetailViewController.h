//
//  WorkoutDetailViewController.h
//  WorkoutLog
//
//  Created by Sharif on 3/28/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutEntryTemplate.h"

@interface WorkoutDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;
@property (strong, nonatomic) WorkoutEntryTemplate *detailObject;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
