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

@protocol ControllerProto <NSObject>
-(void) playerReady;
-(void) showPlayer:(DGPlayer*) player;
-(void) gameEndedWithLooser:(DGPlayer*) looser;
@end

@interface DGController : NSObject{
//    NSMutableArray* drinks;
    NSMutableArray* players;
    NSMutableDictionary *drinkar;
    int gameLevel;
    int playerCount;
    int currentPlayer;
    id <ControllerProto> delegate;
}
@property(nonatomic,assign)id delegate;

//@property (nonatomic, retain) NSMutableArray* drinks;
@property (nonatomic, retain) NSMutableArray* players;
@property (nonatomic, retain) NSMutableDictionary *drinkar;;

@property int gameLevel;
@property int playerCount;

-(DGPlayer*) NextPlayerRepeatPlayers:(bool) PlayerRepeat;
- (void)addPlayerWithimage:(UIImage*) imageIn name:(NSString*)nameIn weight:(int)weightIn isFemale:(bool) isFemaleIn;
+ (id) sharedInstance;
-(void) GameEndedWithLooser:(DGPlayer*) looser;
-(void) showPlayer:(DGPlayer*) player;


@end
