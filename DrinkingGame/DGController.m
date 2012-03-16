//
//  DGController.m
//  DrinkingGame
//
//  Created by student on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGController.h"

@implementation DGController
@synthesize testing;
@synthesize fullAuto;
@synthesize debugging;
@synthesize players;
@synthesize drinks;

@synthesize gameLevel,playerCount;
//@synthesize delegate;
@synthesize games;
//@synthesize isTwetting;
@synthesize mainViewController;

-(void) autoFillPlayers {
    [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"Soini.jpeg"] name:@"Soini" weight:100 isFemale:false]];
    [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"niini.png"] name:@"Niini" weight:80 isFemale:false]];
    [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"naama.jpg"] name:@"Naama" weight:60 isFemale:false]];
    [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"haddock.jpg"] name:@"Haddock" weight:80 isFemale:false]];
    [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"poirot.jpg"] name:@"Poirot" weight:90 isFemale:false]];
    [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"norris.jpg"] name:@"Norris" weight:80 isFemale:false]];
}

-(id) init {
    self = [super init];
    if (self) {
#ifdef FULL_AUTO
        self.fullAuto = FULL_AUTO;
#endif
#ifdef GAME_LEVEL
        self.gameLevel = GAME_LEVEL;  
#endif
#ifdef DEBUGGING
        self.debugging = DEBUGGING;
#endif
        drinks = [[NSMutableDictionary alloc] init];
        [drinks setValue:[[DGDrink alloc] initWithVolumeCl:2 procent:40 andName:@"Shot"] forKey:@"Shot"];
        [drinks setValue:[[DGDrink alloc] initWithVolumeCl:8 procent:11 andName:@"Wine"] forKey:@"Wine"];
        [drinks setValue:[[DGDrink alloc] initWithVolumeCl:16 procent:4.7 andName:@"Beer"] forKey:@"Beer"];

        // has 17.5mg alcohole
        [drinks setValue:[[DGDrink alloc] initWithVolumeCl:30 procent:5 andName:@"TESTDRINK"] forKey:@"TEST"];
        
        
        players = [[NSMutableArray alloc] init];
#ifdef FULL_AUTO
        if (fullAuto) {
            [self autoFillPlayers];
            playerCount = [players count];
        } else {
//            playerCount = [players count];
            if (self.debugging) {
                [self autoFillPlayers];
                playerCount = [players count];
            }
            NSLog(@"No full auto; launch menu");
            [self.mainViewController launchMenu];
        }
#endif
//        [self autoFillPlayers];
//        playerCount = [players count];
        currentPlayer = 0;
                
        games = [[NSMutableDictionary alloc]init];
        
        [games setValue:[[DGGameSimonSays alloc] init] forKey:@"Simon Says"];
        
        [games setValue:[[DGTestGameTwo alloc] init] forKey:@"Whack A Mole"];
        
        [games setValue:[[DGRandomShot alloc] init] forKey:@"Random Shot"];
        
        [games setValue:[[DGFillTheBottle alloc] init] forKey:@"Fill the Bottle"];
        
        [games setValue:[[DGSteadyHands alloc] init] forKey:@"Steady Hands"];
        
        [games setValue:[[DGLogic alloc] init] forKey:@"Logic Game"];
//        [[DGController sharedInstance] launchGame:[games valueForKey:@"Simon Says"]];
    }
    return self;
} 

-(void) linkMainViewController:(DrinkingGameViewController*)gameViewController{
    self.mainViewController = gameViewController;
}

-(float) getTargetPromille:(int) level{
    switch (level) {
        case 0:
            return 0.75;
        case 1:
            return 1.25;
        case 2:
            return 1.5;
        case 3:
            return 2.5;
        default:
            return 0;
    }
}

-(float) getTargetPromille {
    return [self getTargetPromille:self.gameLevel];
}

-(DGPlayer*) getMostDrunkPlayer {
    [[[DGController sharedInstance] players]sortUsingSelector:@selector(comparePromille:)];

    if([[[players objectAtIndex:0] getPromille] floatValue] >= [self getTargetPromille:gameLevel])
        return [players objectAtIndex:0];   
    else 
        return nil;
}

-(DGPlayer*) NextPlayerRepeatPlayers:(_Bool)PlayerRepeat {
    DGPlayer *next = nil;
    if(currentPlayer < playerCount-1){
        currentPlayer++;
        next =  [players objectAtIndex:currentPlayer];  
    } else if(PlayerRepeat){
        NSLog(@"REPEAT PLAYER");
        next = [players objectAtIndex:0];
    }
    return next;
}

-(void) showPlayer:(DGPlayer*) player {
    NSLog(@"DGController ShowPlayer");
    [self.mainViewController showPlayer:player];
}

-(void) gameEndedWithLoser:(DGPlayer *)player {
    //[delegate showPlayer:loser];
    NSLog(@"DGController gameEndedWithLoser:");
    DGController* gameController = [DGController sharedInstance];
    if (gameController.fullAuto) {
        NSLog(@"player %@ took Shot", player.name);
        [player takeShot:[gameController.drinks valueForKey:@"Shot"]];
    } else {
        [self.mainViewController gameEndedWithPlayer:player];
    }
}

-(void) addPlayerWithimage:(UIImage*) imageIn name:(NSString*)nameIn weight:(int)weightIn isFemale:(bool) isFemaleIn{
    [players addObject:[[DGPlayer alloc] initWithimage:imageIn name:nameIn weight:weightIn isFemale:isFemaleIn]];
    NSLog(@"Adding player %@", nameIn);
}

#ifdef TWITTING
static BOOL isTwitting = TWITTING;

+(void) twitting:(BOOL) shallTwitt {
    isTwitting = shallTwitt;
}
#endif

-(void) startRandomGame{
    srand ( time(NULL) );
    int r = rand()% [games count];
    NSLog(@"Launching game %i of %i", r+1, [games count]);
    NSString * gameID = [[games allKeys] objectAtIndex:r];
    [self launchGame:[games valueForKey:gameID]];
}

-(void) presentResultat {
    DGPlayer* winnerPlayer = [self getMostDrunkPlayer];
    NSLog(@"And the winner is %@ with amasing %@ promille", [winnerPlayer name], [winnerPlayer getPromille]);
    [self.mainViewController showPlayerStats:nil];
#ifdef TWITTING    
    if (isTwitting) {
        NSLog(@"Twetting %@", isTwitting );
        //
    }
#endif
}

-(void) startCompetition {
    if (self.fullAuto && [players count] == 0) {
        [self autoFillPlayers];
        NSLog(@"DGController: startCompetition: players count: %i", [players count]);
    }
    while ([self getMostDrunkPlayer] == nil) {
        [self startRandomGame];
    }
    [self presentResultat];
}

-(void) launchGame:(DGGame*) game{
    [self.mainViewController launchGameView:game];
}

static id sharedController = nil;

+(void) initialize {
    if (self == [DGController class]) {
        sharedController = [[self alloc] init];
    }
}

+(id) sharedInstance {    
    if (sharedController == nil) {
        NSLog(@"sharedController init");
        sharedController = [[self alloc] init];
        NSLog(@"sharedController: %@", sharedController);
    }
    
    return sharedController;
}

//-(BOOL) testing{
//    return self.testing;
//}

//-(void) setTesting:(BOOL) value{
//    _testing = value;
//}

@end
   
