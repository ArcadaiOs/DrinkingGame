//
//  DrinkingGameViewController.m
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DrinkingGameViewController.h"




@implementation DrinkingGameViewController


@synthesize gameState, previousState;
//menu 1
@synthesize players, background1, menuNumbers, pointBackActive1, pointNextActive1, pointBackActive2, pointNextActive2, pointBack, pointNext;
@synthesize selected2, selected3, selected4, selected5, selected6, selected7, selected8;
@synthesize btnContinue, btnBack, btnContinue2, btnBack2, btnContinue3, btnBack3;
@synthesize btn2, btn3, btn4, btn5, btn6, btn7, btn8;
//menu 2
@synthesize menu2;

@synthesize bottleEasySelected, bottleMediumSelected, bottleHardSelected, bottleCustomSelected;
@synthesize buttonEasySelected, buttonHardSelected, buttonCustomSelected, buttonMediumSelected;





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




-(IBAction)buttonClickedBack {
    
    if (self.view == secondView) {
        
        self.view = firstView;
    }
    else {
        

    }
    
    


}

//Meny 1

-(IBAction)buttonPlayers2 {
    
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





 //lalllaaa
    
@end