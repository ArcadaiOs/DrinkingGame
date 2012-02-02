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
    DGController* controller;
}
@property (nonatomic, retain) DGController* controller;
- (id)initWithController: (DGController*) controller;
-(IBAction) endGame:(id)sender;

@end
