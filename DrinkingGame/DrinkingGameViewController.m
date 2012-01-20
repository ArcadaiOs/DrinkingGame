//
//  DrinkingGameViewController.m
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DrinkingGameViewController.h"

#define kStateFirst 1
#define kStateSecond 2
#define kStateThird 3
#define kStateFourth 4
#define kStateFifth 5


@implementation DrinkingGameViewController

@synthesize singlePicker, pickerData;
@synthesize gameState, previousState;
@synthesize box, players;
@synthesize btnContinue, btnBack;



-(void) menuLoop {
    
    if (gameState == kStateFirst) {
    
        if (previousState == kStateFirst)
        {
    
            box.hidden = 0;
            players.hidden = 0;

            
            
    
}
        
        previousState = kStateFirst;

    }
    
    else if (gameState == kStateSecond) {
        
        gameState = kStateSecond;
        
        box.hidden = 1;
        players.hidden = 1;
        
        
    }
}

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
    
//    NSString *title = [[NSString alloc] initWithFormat:
//                       @"You chose %@!", selected];
//    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message : @"Good luck & Have fun!" delegate:nil cancelButtonTitle :@"Continue" otherButtonTitles :nil];
    
//    [alert show];
//    [alert release];
//    [title release];
}


- (void)viewDidLoad
{
    
    [NSTimer scheduledTimerWithTimeInterval:1.0/60 target:self selector:@selector(menuLoop) userInfo:nil repeats:YES];
    NSArray *array = [[NSArray alloc] initWithObjects:@"2 players",@"3 players",@"4 players",@"5 players",@"6 players", @"7 players",@"8 players",nil];

    gameState = kStateFirst;
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




-(IBAction)buttonClickedContinue {

 
    if (gameState == kStateFirst) {
        
        gameState = kStateSecond;
    }
    else if (gameState == kStateSecond) {
        gameState = kStateThird;
    
    }
    
    else if (gameState == kStateThird) {
        
        gameState = kStateFourth;
    }
    
    else if (gameState == kStateFourth) {
        
        gameState = kStateFifth;
    }
}


-(IBAction)buttonClickedBack {
    
    if (gameState == kStateSecond) {
        
        gameState = kStateFirst;
    }
    else if (gameState == kStateThird) {
        gameState = kStateSecond;
        
    }
    
    else if (gameState == kStateFourth) {
        
        gameState = kStateThird;
    }
    
    else if (gameState == kStateFifth) {
        
        gameState = kStateFourth;
    }
}



    
@end