//
//  DrinkingGameViewController.h
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGGame.h"
#import "DGRandomShot.h"
#import "DGController.h"
#import "DGGameSimonSays.h"
#import "DGSteadyHands.h"
#import "DGViewPlayer.h"
#import "DGTestGameTwo.h"
#import "DGFillTheBottle.h"
#import "DGStartMenu.h"
#import "DGDrinkDispenser.h"

@interface DrinkingGameViewController : UIViewController{
    DGGame *currentCame;
    DGController* controller;
    DGDrinkDispenser *dispenser;
    
}
@property (readonly, nonatomic) DGController* controller;
@property (readwrite, nonatomic) DGDrinkDispenser *dispenser;

-(DGController *) controller;

-(IBAction) showPlayer:(id)sender;
-(IBAction) launchTestGame:(id)sender;
-(IBAction) launchSimon:(id)sender;
-(IBAction) launchSteadyHands:(id)sender;
-(IBAction) launchWhackAMole:(id)sender;
-(IBAction) launchFillTheBottle:(id)sender;
-(IBAction) launchMenu:(id)sender;



@end
