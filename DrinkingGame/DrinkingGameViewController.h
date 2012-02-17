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

typedef struct{
    NSString *playerName;
    int score;
} score;

@protocol ViewControllerProto <NSObject>
-(void) playerReady;
@end


@interface DrinkingGameViewController : UIViewController{
    DGGame *currentCame;
    DGController* controller;
    
    IBOutlet UIView *boozeChooserView;
    IBOutlet UILabel *boozeChoose;
    IBOutlet UIView *playerImgFrame;    
    IBOutlet UIImageView *playerImg;
    IBOutlet UIView *nextPlayerView;
    id <ViewControllerProto> delegate;
    UIViewController *viewControl;
}

@property (readonly, nonatomic) DGController* controller;
@property(nonatomic,assign)id delegate;

-(DGController *) controller;

-(IBAction) showPunnishmentChooser:(id)sender;
-(IBAction) punnishmentChosen:(id) sender;

-(void) showPlayer:(DGPlayer*)player;
-(void) playerReadyToPlay;
-(IBAction) showNext:(id)sender;
-(void) gameEndedWithScores:(NSString*) scores;
-(IBAction) launchTestGame:(id)sender;
-(IBAction) launchSimon:(id)sender;
-(IBAction) launchSteadyHands:(id)sender;
-(IBAction) launchWhackAMole:(id)sender;
-(IBAction) launchFillTheBottle:(id)sender;
-(IBAction) launchMenu:(id)sender;
@end
