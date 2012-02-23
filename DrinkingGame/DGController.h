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
@end

@interface DGController : NSObject{
    NSMutableArray* drinks;
    NSMutableArray* players;
    int gameLevel;
    int playerCount;
//    DGController * controller;
    id <ControllerProto> delegate;
}
@property(nonatomic,assign)id delegate;

-(void) GameEndedWithLooser:(DGPlayer*) looser;
-(void) showPlayer:(DGPlayer*) player;
-(void) playerReady;
@property (nonatomic, retain) NSMutableArray* drinks;
@property (nonatomic, retain) NSMutableArray* players;
@property int gameLevel;
@property int playerCount;
//@property (nonatomic, retain) DGController * controller;
- (void)addPlayerWithimage:(UIImage*) imageIn name:(NSString*)nameIn weight:(int)weightIn isFemale:(bool) isFemaleIn;

+ (id) sharedInstance;
- (void) startRandomGame;
@end
