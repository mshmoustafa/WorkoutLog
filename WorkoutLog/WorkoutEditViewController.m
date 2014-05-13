//
//  WorkoutEditViewController.m
//  WorkoutLog
//
//  Created by Sharif on 4/25/14.
//  Copyright (c) 2014 Muhammad-Sharif Moustafa. All rights reserved.
//

#import "WorkoutEditViewController.h"
#import "DateEditViewController.h"

#import "WorkoutLogStore.h"

@interface WorkoutEditViewController ()

@end

@implementation WorkoutEditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
//        self.minutesPicker.dataSource = self;
//        self.secondsPicker.dataSource = self;
//        
//        self.minutesPicker.delegate = self;
//        self.secondsPicker.delegate = self;
    }
    return self;
}

- (void)initializeArrays
{
    self.seconds = [[NSMutableArray alloc] init];
    for (int i = 0; i < 60; i++) {
        [self.seconds addObject:[NSNumber numberWithInt:i]];
    }
    
    self.minutes = [[NSMutableArray alloc] init];
    for (int i = 0; i < 100; i++) {
        [self.minutes addObject:[NSNumber numberWithInt:i]];
    }
    
    self.minutesPicker.tag = 1;
    self.secondsPicker.tag = 2;
}

- (void)initializeFields
{
    [self cell:self.dateCell setHidden:!shouldShowDateCell];
    [self reloadDataAnimated:YES];
//    [self.dateCell setHidden:YES];
    
    self.datePicker.date = self.workoutTemplate.date;
    
    self.minutesPicker.tag = 1;
    self.secondsPicker.tag = 2;
    
    self.nameLabel.text = self.workoutTemplate.name;
    self.planLabel.text = self.workoutTemplate.plan;
    self.repsLabel.text = [[NSNumber numberWithLong:self.workoutTemplate.reps] stringValue];
    self.repsStepper.value = self.workoutTemplate.reps;
    self.setsLabel.text = [[NSNumber numberWithLong:self.workoutTemplate.sets] stringValue];
    self.setsStepper.value = self.workoutTemplate.sets;
    self.weightLabel.text = [[NSNumber numberWithLong:self.workoutTemplate.weight] stringValue];
    self.weightStepper.value = self.workoutTemplate.weight;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    // Do any additional setup after loading the view.
    
//    [self initializeFields];
    [self initializeArrays];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self initializeFields];
    
    for (NSNumber *min in self.minutes) {
        if (self.workoutTemplate.min == [min unsignedIntegerValue]) {
            NSLog(@"index of minute = %lu", (unsigned long)[self.minutes indexOfObject:min]);
            [self.minutesPicker selectRow:[self.minutes indexOfObject:min] inComponent:0 animated:YES];
            self.selectedMinutes = [min unsignedIntegerValue];
        }
    }
    for (NSNumber *sec in self.seconds) {
        if (self.workoutTemplate.sec == [sec unsignedIntegerValue]) {
            [self.secondsPicker selectRow:[self.seconds indexOfObject:sec] inComponent:0 animated:YES];
            self.selectedSeconds = [sec unsignedIntegerValue];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)shouldShowDateButton:(BOOL)yesOrNo
{
    shouldShowDateCell = yesOrNo;
}



//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    
//    return nil;
//}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
//    if ([segue.identifier isEqualToString:@"showDateView"]) {
//        DateEditViewController *vc = [segue destinationViewController];
//        vc.workout = self.workoutTemplate;
//    }
}

- (long)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (long)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView.tag == 1) {
        return self.minutes.count;
    }
    else {return self.seconds.count;}
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (pickerView.tag == 1) {
        NSString *string = [((NSNumber *)[self.minutes objectAtIndex:row]) stringValue];
        return string;
    } else {
        NSString *string = [((NSNumber *)[self.seconds objectAtIndex:row]) stringValue];
        return string;
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    if (pickerView.tag == 1) {
        self.selectedMinutes = [[self.minutes objectAtIndex:row] integerValue];
    } else {
        self.selectedSeconds = [[self.seconds objectAtIndex:row] integerValue];
    }
}

- (IBAction)repStepperChanged:(id)sender {
    self.repsLabel.text = [[NSNumber numberWithDouble:self.repsStepper.value] stringValue];
}

- (IBAction)setsStepperChanged:(id)sender {
    self.setsLabel.text = [[NSNumber numberWithDouble:self.setsStepper.value] stringValue];
}

- (IBAction)weightStepperChanged:(id)sender {
    self.weightLabel.text = [[NSNumber numberWithDouble:self.weightStepper.value] stringValue];
}

- (IBAction)dateButtonClicked:(id)sender {
    
}

- (IBAction)done:(id)sender {
    self.workoutTemplate.name = self.nameLabel.text;
    self.workoutTemplate.reps = [self.repsLabel.text integerValue];
    self.workoutTemplate.sets = [self.setsLabel.text integerValue];
    self.workoutTemplate.weight = [self.weightLabel.text integerValue];
    self.workoutTemplate.min = self.selectedMinutes;
    self.workoutTemplate.sec = self.selectedSeconds;
    
    if (shouldShowDateCell) {
        self.workoutTemplate.date = [WorkoutLogStore dateMidnight:self.datePicker.date];
    }
    
    [[WorkoutLogStore sharedStore] saveData];
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view resignFirstResponder];
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
