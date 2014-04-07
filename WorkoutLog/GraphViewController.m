//
//  GraphViewController.m
//  WorkoutLog
//
//  Created by Sharif on 4/6/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "GraphViewController.h"
#import "GraphView.h"

@interface GraphViewController ()

@end

@implementation GraphViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillLayoutSubviews
{
    CGSize contentSize;
    contentSize.width = 1000;
    contentSize.height = 1000;
    self.scrollView.contentSize = contentSize;
//    CGSize size;
//    size.height = 500;
//    size.width = 500;
//    CGPoint origin = CGPointMake(0.0, 0.0);
//    CGRect frame;
//    frame.size = size;
//    frame.origin = origin;
//    self.graphView.frame = frame;
//    [self.graphView setBackgroundColor:[UIColor yellowColor]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    GraphView *gv = [[GraphView alloc] init];
    
//    [self.scrollView addSubview:gv];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
