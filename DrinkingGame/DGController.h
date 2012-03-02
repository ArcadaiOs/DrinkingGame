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
    NSMutableArray* players;
    NSMutableDictionary *drinks;
    int gameLevel;
    int playerCount;
    int currentPlayer;
    id <ControllerProto> delegate;
}
@property(nonatomic,assign)id delegate;
@property (nonatomic, retain) NSMutableArray* players;
@property (nonatomic, retain) NSMutableDictionary *drinks;

@property int gameLevel;
@property int playerCount;

+ (id) sharedInstance;

-(DGPlayer*) NextPlayerRepeatPlayers:(bool) PlayerRepeat;
- (void)addPlayerWithimage:(UIImage*) imageIn name:(NSString*)nameIn weight:(int)weightIn isFemale:(bool) isFemaleIn;

-(void) GameEndedWithLooser:(DGPlayer*) looser;
-(void) showPlayer:(DGPlayer*) player;


@end
