//
//  DGController.h
//  DrinkingGame
//
//  Created by student on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DGDrink.h"
#import "DGPlayer.h"

#define FULL_AUTO (NO);
#define TESTING (NO);
#define TWITTING (NO);
#define DEBUGGING (YES);
#define GAME_LEVEL (0);

//#import "DGGame.h"
@class DrinkingGameViewController;
@class DGGame;
@class DGGameSimonSays;
@class DGRandomShot;
@class DGTestGameTwo;
@class DGRandomShot;
@class DGFillTheBottle;
@class DGSteadyHands;

//#import "DGGameSimonSays.h"
//@protocol ControllerProto <NSObject>

//@end



@interface DGController : NSObject{
//    BOOL fullAuto;
    NSMutableArray* players;
    NSMutableDictionary *drinks;
    NSMutableDictionary *games;
//    BOOL isTwitting;
    int gameLevel;

    int playerCount;
    int currentPlayer;
//    id <ControllerProto> delegate;
    DrinkingGameViewController* mainViewController;
}

@property (nonatomic, retain) DrinkingGameViewController* mainViewController;
//@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) NSMutableArray* players;
@property (nonatomic, retain) NSMutableDictionary *drinks;
@property (nonatomic, retain) NSMutableDictionary* games;
@property BOOL testing;
@property BOOL fullAuto;
@property BOOL debugging; 

@property int gameLevel;
@property int playerCount;


+(id) sharedInstance;
-(void) autoFillPlayers;
-(void) linkMainViewController:(DrinkingGameViewController*)gameViewController;
-(float) getTargetPromille:(int) level;
-(float) getTargetPromille;

-(DGPlayer*) NextPlayerRepeatPlayers:(bool) PlayerRepeat;
-(void) addPlayerWithimage:(UIImage*) imageIn 
                      name:(NSString*) nameIn 
                    weight:(int) weightIn 
                  isFemale:(bool) isFemaleIn;

//-(void) GameEndedWithLoser:(DGPlayer*) loser;
-(void) showPlayer:(DGPlayer*) player;
-(void) startCompetition;

//-(void) playerReady;
-(void) showPlayer:(DGPlayer*) player;
-(void) gameEndedWithLoser:(DGPlayer*) looser;
-(void) launchGame:(DGGame*) game;
//-(BOOL) testing;
//-(void) setTesting:(BOOL) value;
@end
