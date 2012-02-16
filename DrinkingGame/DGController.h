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
@interface DGController : NSObject{
    NSMutableArray* drinks;
    NSMutableArray* players;
    int gameLevel;
    int playerCount;
//    DGController * controller;
}

-(void) GameEndedWithLooser:(DGPlayer*) looser;

@property (nonatomic, retain) NSMutableArray* drinks;
@property (nonatomic, retain) NSMutableArray* players;
@property int gameLevel;
@property int playerCount;
//@property (nonatomic, retain) DGController * controller;
- (void)addPlayerWithimage:(UIImage*) imageIn name:(NSString*)nameIn weight:(int)weightIn isFemale:(bool) isFemaleIn;
+ (id) sharedInstance;
- (void) startRandomGame;
@end
