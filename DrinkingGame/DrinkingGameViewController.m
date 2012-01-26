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
//menu 1
@synthesize players, background1, menuNumbers, pointBackActive, pointNextActive, pointBack, pointNext;
@synthesize selected2, selected3, selected4, selected5, selected6, selected7, selected8;
@synthesize btnContinue, btnBack;
@synthesize btn2, btn3, btn4, btn5, btn6, btn7, btn8;
//menu 2
@synthesize menu2;
@synthesize bottleEasySelected, bottleMediumSelected, bottleHardSelected, bottleCustomSelected;
@synthesize Menu2EasySelected, Menu2HardSelected, Menu2CustomSelected, Menu2MediumSelected;


-(void) menuLoop {
    
    if (gameState == kStateFirst) {
    
        if (previousState == kStateFirst)
        {
    

            
            Menu2EasySelected.hidden = 1;
            Menu2MediumSelected.hidden = 1;
            Menu2HardSelected.hidden = 1;
            Menu2CustomSelected.hidden = 1;

            menu2.hidden = 1;
            
      
}
        
        previousState = kStateFirst;

    }
    
    else if (gameState == kStateSecond) {
        
        gameState = kStateSecond;
        
        background1.hidden = 0;
        players.hidden = 1;
        menuNumbers.hidden = 1;
        menu2.hidden = 0;
        
        selected2.hidden = 1;
        selected3.hidden = 1;
        selected4.hidden = 1;
        selected5.hidden = 1;
        selected6.hidden = 1;
        selected7.hidden = 1;
        selected8.hidden = 1;


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


//Meny 1

-(IBAction)buttonPlayers2 {
    
    pointNextActive.hidden = 0;
    selected2.hidden = 0;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers3 {
    
    pointNextActive.hidden = 0;
    selected2.hidden = 1;
    selected3.hidden = 0;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers4 {
    
    pointNextActive.hidden = 0;
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 0;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers5 {
    
    pointNextActive.hidden = 0;
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 0;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers6 {
    
    pointNextActive.hidden = 0;
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 0;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers7 {
    
    pointNextActive.hidden = 0;
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 0;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers8 {
    
    pointNextActive.hidden = 0;
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 0;
    
}

//Meny 2


-(IBAction)buttonEasySelected {
    
    Menu2EasySelected.hidden = 0;
    Menu2MediumSelected.hidden = 1;
    Menu2HardSelected.hidden = 1;
    Menu2CustomSelected.hidden = 1;
    
}

-(IBAction)buttonMediumSelected {
    
    Menu2EasySelected.hidden = 1;
    Menu2MediumSelected.hidden = 0;
    Menu2HardSelected.hidden = 1;
    Menu2CustomSelected.hidden = 1;
}

-(IBAction)buttonHardSelected {

    Menu2EasySelected.hidden = 1;
    Menu2MediumSelected.hidden = 1;
    Menu2HardSelected.hidden = 0;
    Menu2CustomSelected.hidden = 1;
}

-(IBAction)buttonCustomSelected {
    
    Menu2EasySelected.hidden = 1;
    Menu2MediumSelected.hidden = 1;
    Menu2HardSelected.hidden = 1;
    Menu2CustomSelected.hidden = 0;
}

    
@end