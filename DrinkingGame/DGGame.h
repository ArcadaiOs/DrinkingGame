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
}
@property (nonatomic, retain) DGController* controller;
- (id)initWithController: (DGController*) controller;
-(IBAction) endGame:(id)sender;
-(void) showPlayer:(DGPlayer*) player;
-(void) playerReady;
@end
