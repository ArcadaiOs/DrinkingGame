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
#import "SimpleAudioEngine.h"
#import "DGPlayerStatView.h"
typedef struct{
    NSString *playerName;
    int score;
} score;

@protocol ViewControllerProto <NSObject>
-(void) playerReady;
@end


@interface DrinkingGameViewController : UIViewController{
    DGGame *currentGame;
    DGController* controller;
    
    //twitter
    //IBOutlet UIButton *twitterButton;
    
    
    IBOutlet UIView *playerLostView;
    IBOutlet UIView *boozeChooserView;
    IBOutlet UIView*boo;
    
    IBOutlet UILabel *lostLabel;
    IBOutlet UILabel *playerNameLabel;    
    IBOutlet UIView *playerImgFrame;    
    IBOutlet UIImageView *playerImg;
    IBOutlet UIView *nextPlayerView;
    
    IBOutlet UITableView* statView;

    id <ViewControllerProto> delegate;
    UIViewController *viewControl;
    
    IBOutlet UIView *debugView;
}

@property (readonly, nonatomic) DGController* controller;
@property(nonatomic,assign)id delegate;
-(DGController *) controller;

//twitter
/*
@property (retain) UIButton *twitterButton;
-(IBAction)twitterAction:(id)sender;
*/

-(IBAction) showPlayerStats:(id)sender;

-(IBAction) showPunnishmentChooser:(id)sender;
-(IBAction) punnishmentChosen:(id) sender;
-(void) gameEndedWithLooser:(DGPlayer*) player;
-(void) showPlayer:(DGPlayer*)player;

-(IBAction) launchLOOSER:(id)sender;

-(void) launchGame:(DGGame*)game;

-(IBAction) launchRandomShot:(id)sender;
-(IBAction) launchSimon:(id)sender;
-(IBAction) launchSteadyHands:(id)sender;
-(IBAction) launchWhackAMole:(id)sender;
-(IBAction) launchFillTheBottle:(id)sender;
-(IBAction) launchMenu:(id)sender;
-(IBAction) stopMusic:(id)sender;
//-(void)handleTap:(UITapGestureRecognizer *)sender;
@end
