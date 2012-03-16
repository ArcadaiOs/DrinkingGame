//
//  DrinkingGameViewController.h
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "DGGame.h"
#import "DGRandomShot.h"
#import "DGController.h"
#import "DGGameSimonSays.h"
#import "DGSteadyHands.h"
#import "DGTestGameTwo.h"
#import "DGFillTheBottle.h"
#import "DGLogic.h"
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
    DGController* competitionController;
    
    //twitter
    IBOutlet UIButton *twitterButton;
    //IBOutlet UIButton *twitterButton;
    
    
    IBOutlet UIView *playerLostView;
    IBOutlet UIView *boozeChooserView;
    IBOutlet UIView *boo;
//    IBOutlet UIView *view;
    
    IBOutlet UILabel *lostLabel;
    IBOutlet UILabel *playerNameLabel;    
    IBOutlet UIView *playerImgFrame;    
    IBOutlet UIImageView *playerImg;
    IBOutlet UIView *nextPlayerView;
    
    IBOutlet UITableView* statView;

    id <ViewControllerProto> delegate;
    UIViewController *viewControl;
    
    IBOutlet UIView *debugView;
    DGPlayer *loosingPlayer;
    UITabBarController *tabBarController;
}


@property (readonly, nonatomic) DGController* competitionController;
@property (readonly, retain) UIView* debugView;
@property(nonatomic,assign)id delegate;
//-(DGController *) controller;
//-(id)initWithController: (DGController*) controllerIn;

//twitter

@property (retain) UIButton *twitterButton;
-(IBAction)twitterAction:(id)sender;


-(IBAction) showPunnishmentChooser:(id)sender;
-(IBAction) punnishmentChosen:(id) sender;
-(void) gameEndedWithPlayer:(DGPlayer*) player;
-(void) showPlayer:(DGPlayer*)player;
-(IBAction)showPlayerStats:(id)sender;

-(IBAction) launchLOOSER:(id)sender;

-(void) launchGameView:(DGGame*)game;

-(IBAction) launchRandomShot:(id)sender;
-(IBAction) launchSimon:(id)sender;
-(IBAction) launchSteadyHands:(id)sender;
-(IBAction) launchWhackAMole:(id)sender;
-(IBAction) launchFillTheBottle:(id)sender;
-(IBAction) launchMenu:(id)sender;
-(IBAction) stopMusic:(id)sender;
//-(void)handleTap:(UITapGestureRecognizer *)sender;
-(IBAction) fullAuto:(id)sender;
-(id) initWithNibName:(NSString*) nibNameOrNil bundle:(NSBundle*) nibBundleOrNil;
@end
