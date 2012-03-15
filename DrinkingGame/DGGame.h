//
//  DGGame.h
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGController.h"

typedef enum {
    turnBased,
    allAtOnce,
    oneonone,
    twoontwo,
    threeonthree,
    fouronfore
} GameType;


@interface DGGame : UIViewController{
    GameType gameType;
    DGPlayer *CurrentPlayer;
    bool OnePlayerOnce;
    NSString *name;
}

@property(nonatomic, retain) NSString *name;


-(IBAction) endGame:(id)sender;
-(void) GameEndedCalculateScores;
-(void) showPlayer:(DGPlayer*) player;
-(void) playerReady;
-(void) NextPlayer;

-(void) startGame;

@end
