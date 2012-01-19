//
//  DGGame.h
//  DrinkingGame
//
//  Created by student on 1/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrinkingGameViewController.h"
typedef enum GameType {
    turnBased,
    allAtOnce,
    oneonone,
    twoontwo
    }GameType;


@interface DGGame : NSObject{
    NSString *name;
    GameType type;
    DrinkingGameViewController *myController;

}

-(id) startGameWithController:(DrinkingGameViewController*) controller;
-(void) endGame;

@end
