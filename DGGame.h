//
//  DGGame.h
//  DrinkingGame
//
//  Created by student on 1/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum GameType {
    turnBased,
    allAtOnce,
    oneonone,
    twoontwo
}GameType;


@interface DGGame : UIView{
    NSString *name;
    GameType type;
}

@end
