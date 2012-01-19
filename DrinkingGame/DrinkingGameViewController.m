//
//  DrinkingGameViewController.m
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DrinkingGameViewController.h"

@implementation DrinkingGameViewController

@synthesize singlePicker;
@synthesize pickerData;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        // Custom initialization
    }
    return self;
}

-(IBAction)buttonPressed1
{
    NSInteger row = [singlePicker selectedRowInComponent:0];
    
    NSString *selected = [pickerData objectAtIndex:row];
    
    NSString *title = [[NSString alloc] initWithFormat:
                       @"you selected %@!", selected];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message : @"Thank you for choosing." delegate:nil cancelButtonTitle :@"Welcome" otherButtonTitles :nil];
    
    [alert show];
    [alert release];
    [title release];
}


- (void)viewDidLoad
{
    NSArray *array = [[NSArray alloc] initWithObjects:@"2 players",@"3 players",@"4 players",@"5 players",@"6 players", @"7 players",@"8 players",nil];

    
    self.pickerData = array;
    [array release];
    [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    
}

- (void)dealloc
{
    [singlePicker release];
    [pickerData release];
    [super dealloc];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [pickerData count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return[pickerData objectAtIndex:row];
}

@end