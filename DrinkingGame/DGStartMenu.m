//
//  DrinkingGameViewController.m
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGStartMenu.h"


#define twoPlayers 2



@implementation DGStartMenu


//@synthesize gameState, previousState;
//menu 1
@synthesize players, background1, menuNumbers, pointBackActive1, pointNextActive1, pointBackActive2, pointNextActive2, pointNextActive3, pointBackActive3, pointBack, pointNext;
@synthesize selected2, selected3, selected4, selected5, selected6, selected7, selected8;
@synthesize btnContinue, btnBack, btnContinue2, btnBack2, btnContinue3, btnBack3;
@synthesize btn2, btn3, btn4, btn5, btn6, btn7, btn8;
//menu 2
@synthesize menu2;
@synthesize menu3CrossMale, menu3CrossFemale, menu3male, menu3female;
@synthesize bottleEasySelected, bottleMediumSelected, bottleHardSelected, bottleCustomSelected;
@synthesize buttonEasySelected, buttonHardSelected, buttonCustomSelected, buttonMediumSelected;
@synthesize weight, name;





- (void)viewDidLoad
{
    
    
    
    
    
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
    firstView = self.view;
    
    
    if (self.view == secondView) {
        
        self.view = thirdView;
    }
    else {
        
        self.view = secondView;
    }
    
    
    
}

// Pyry should fix this
-(UIImage*) getImage{
    return nil;
}

-(IBAction)buttonGetNewPlayer {
    
    // save new player
    DGController* controller = [DGController getController];
    int w = 0; // number from self.weight
    BOOL gender = NO; // BOOL from self.gender
    [controller addPlayerWithimage:[self getImage] weight:w  isFemale:gender];
    if (amountOfPlayers == 0) {
        // go and play
    } else {
        // clear view 
        // minska amountOfPlayers by one 
    }
    
    
    
    
    
    
}


-(IBAction)buttonClickedBack {
    
    if (self.view == secondView) {
        
        self.view = firstView;
    }
    if (self.view == thirdView) {
        
        self.view = secondView;
    }
    
    else {
        
        
    }
    
    
    
    
}

//Meny 1

-(IBAction)buttonPlayers2 {
    
    amountOfPlayers = 2;
    btnContinue.hidden = 0;
    pointNextActive1.hidden = 0;
    selected2.hidden = 0;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
    
}
-(IBAction)buttonPlayers3 {
    
    amountOfPlayers = 3;
    btnContinue.hidden = 0;
    pointNextActive1.hidden = 0;
    selected2.hidden = 1;
    selected3.hidden = 0;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers4 {
    
    btnContinue.hidden = 0;
    pointNextActive1.hidden = 0;
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 0;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers5 {
    
    btnContinue.hidden = 0;
    pointNextActive1.hidden = 0;
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 0;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers6 {
    
    btnContinue.hidden = 0;
    pointNextActive1.hidden = 0;
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 0;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers7 {
    
    btnContinue.hidden = 0;
    pointNextActive1.hidden = 0;
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 0;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers8 {
    
    btnContinue.hidden = 0;
    pointNextActive1.hidden = 0;
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
    
    pointNextActive2.hidden = 0;
    bottleEasySelected.hidden = 0;
    bottleMediumSelected.hidden = 1;
    bottleHardSelected.hidden = 1;
    bottleCustomSelected.hidden = 1;
    
}

-(IBAction)buttonMediumSelected {
    
    pointNextActive2.hidden = 0;
    bottleEasySelected.hidden = 1;
    bottleMediumSelected.hidden = 0;
    bottleHardSelected.hidden = 1;
    bottleCustomSelected.hidden = 1;
}

-(IBAction)buttonHardSelected {
    
    pointNextActive2.hidden = 0;
    bottleEasySelected.hidden = 1;
    bottleMediumSelected.hidden = 1;
    bottleHardSelected.hidden = 0;
    bottleCustomSelected.hidden = 1;
}

-(IBAction)buttonCustomSelected {
    
    pointNextActive2.hidden = 0;
    bottleEasySelected.hidden = 1;
    bottleMediumSelected.hidden = 1;
    bottleHardSelected.hidden = 1;
    bottleCustomSelected.hidden = 0;
}

//Meny 3

-(IBAction)menu3male {
    
    menu3CrossMale.hidden = 0;
    menu3CrossFemale.hidden = 1;
    self.gender = NO;
    [self closekeyboard];
}

-(IBAction)menu3female {
    
    menu3CrossMale.hidden = 1;
    menu3CrossFemale.hidden = 0;
    self.gender = YES;
    [self closekeyboard];
    
}


-(IBAction)openkeyboard {
    
    
    thirdView.superview.frame = CGRectMake(0,-200,320,480);
    
    
}

-(IBAction)closekeyboard {
    
    
    
    thirdView.superview.frame = CGRectMake(0,0,320,480);
    [self.view endEditing:TRUE];
    // 
    if  ((![name.text isEqualToString:@"NAME"]) && (![weight.text isEqualToString:@"***"]) && ((menu3CrossMale.hidden == 0) ||
                                                                                               (menu3CrossFemale.hidden == 0))) {
        NSLog(@"lol");
        btnContinue3.hidden = 0;
        pointNextActive3.hidden = 0;
    }
    
}

//        if ((menu3CrossMale.hidden == 0) ||
//            (menu3CrossFemale.hidden == 0)) {




@end