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
#import "DGViewPlayer.h"


typedef struct{
    NSString *playerName;
    int score;
} score;

@interface DrinkingGameViewController : UIViewController{
    DGGame *currentCame;
    DGController* controller;
    
    
}
@property (nonatomic, retain) DGController* controller;

-(IBAction) showPlayer:(id)sender;
-(void) gameEndedWithScores:(NSString*) scores;
-(IBAction) launchTestGame:(id)sender;
-(IBAction) launchSimon:(id)sender;

@end
