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


@synthesize gameState, previousState;
@synthesize players, background1, menuNumbers;
@synthesize selected2, selected3, selected4, selected5, selected6, selected7, selected8;
@synthesize btnContinue, btnBack;
@synthesize btn2, btn3, btn4, btn5, btn6, btn7, btn8;



-(void) menuLoop {
    
    if (gameState == kStateFirst) {
    
        if (previousState == kStateFirst)
        {
    

            
      
}
        
        previousState = kStateFirst;

    }
    
    else if (gameState == kStateSecond) {
        
        gameState = kStateSecond;

        background1.hidden = 1;
        players.hidden = 1;
        menuNumbers.hidden = 1;
        
    }
    
    else if (gameState == kStateThird) {
        
        gameState = kStateThird;
    }
    
    else if (gameState == kStateFourth) {
        
        gameState = kStateFourth;
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


- (void)viewDidLoad
{
    
    [NSTimer scheduledTimerWithTimeInterval:1.0/60 target:self selector:@selector(menuLoop) userInfo:nil repeats:YES];
    NSArray *array = [[NSArray alloc] initWithObjects:@"2 players",@"3 players",@"4 players",@"5 players",@"6 players", @"7 players",@"8 players",nil];

    gameState = kStateFirst;

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

    [super dealloc];
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

-(IBAction)buttonPlayers2 {
    
    
    selected2.hidden = 0;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}

-(IBAction)buttonPlayers3 {
    
    selected2.hidden = 1;
    selected3.hidden = 0;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers4 {
    
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 0;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers5 {
    
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 0;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers6 {
    
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 0;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers7 {
    
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 0;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers8 {
    
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 0;
    
}

    
@end