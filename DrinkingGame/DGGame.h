//
//  DGGame.h
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGController.h"
#import "DGViewPlayer.h"

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
    DGController* controller;
    DGViewPlayer *playerView;
    id < GameEnded > delegate;


}

@property(nonatomic,assign)id delegate;

@property (nonatomic, retain) DGController* controller;
- (id)initWithController: (DGController*) controller;
-(IBAction) endGame:(id)sender;
-(void) showPlayer:(DGPlayer*) player;
-(void) playerReady;
@end
