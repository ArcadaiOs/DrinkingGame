//
//  DGGame.h
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGController.h"

@protocol GameEnded <NSObject>
-(void) GameEndedWithLooser:(DGPlayer *)looser;
@end

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
    DGController *controller;
    id < GameEnded > delegate;
    DGPlayer *CurrentPlayer;
    bool OnePlayerOnce;
    NSString *name;
}

@property(nonatomic, retain) NSString *name;

@property(nonatomic,assign)id delegate;

@property (nonatomic, retain) DGController *controller;

- (id)initWithController: (DGController*) controller;
-(IBAction) endGame:(id)sender;
-(void) GameEndedCalculateScores;
-(void) showPlayer:(DGPlayer*) player;
-(void) playerReady;
-(void) NextPlayer;

-(void) StartGame;

@end
