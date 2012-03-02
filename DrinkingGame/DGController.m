//
//  DGController.m
//  DrinkingGame
//
//  Created by student on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGController.h"

@implementation DGController
//@synthesize drinks;
@synthesize players;
@synthesize drinks;

@synthesize gameLevel,playerCount;
@synthesize delegate;


//@synthesize controller;
- (id)init
{
    self = [super init];
    if (self) {

        
        drinks = [[NSMutableDictionary alloc] init];
        [drinks setValue:[[DGDrink alloc] initWithVolumeCl:2 procent:40 andName:@"Shot"] forKey:@"Shot"];
        [drinks setValue:[[DGDrink alloc] initWithVolumeCl:8 procent:11 andName:@"Wine"] forKey:@"Wine"];
        [drinks setValue:[[DGDrink alloc] initWithVolumeCl:16 procent:4.7 andName:@"Beer"] forKey:@"Beer"];

        
        // has 17.5mg alcohole
        [drinks setValue:[[DGDrink alloc] initWithVolumeCl:30 procent:5 andName:@"TESTDRINK"] forKey:@"TEST"];
        
        
        players = [[NSMutableArray alloc] init];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"Soini.jpeg"] name:@"Soini" weight:100 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"niini.png"] name:@"Niini" weight:80 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"naama.jpg"] name:@"Naama" weight:80 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"haddock.jpg"] name:@"Haddock" weight:80 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"poirot.jpg"] name:@"Poirot" weight:80 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"norris.jpg"] name:@"Norris" weight:80 isFemale:false]];
        playerCount = [players count];

        currentPlayer = 0;
                
    }
    
    return self;
} 

-(DGPlayer*)NextPlayerRepeatPlayers:(_Bool)PlayerRepeat{
    DGPlayer *next = nil;
    if(currentPlayer < playerCount-1){
        currentPlayer++;
        next =  [players objectAtIndex:currentPlayer];  
    } else if(PlayerRepeat){
        next = [players objectAtIndex:0];
    }

    return next;
}
-(void) showPlayer:(DGPlayer*) player{
    NSLog(@"DGController");
    [delegate showPlayer:player];
}
-(void) GameEndedWithLooser:(DGPlayer *)looser{
    //[delegate showPlayer:looser];

    NSLog(@"GAME ENDED AND LOSER IS FOUND");
    [delegate gameEndedWithLooser:looser];
}


- (void)addPlayerWithimage:(UIImage*) imageIn name:(NSString*)nameIn weight:(int)weightIn isFemale:(bool) isFemaleIn{
    [players addObject:[[DGPlayer alloc] initWithimage:imageIn name:nameIn weight:weightIn isFemale:isFemaleIn]];
    NSLog(@"Adding player %@", nameIn);
}

static id sharedController = nil;

+ (void)initialize {
    if (self == [DGController class]) {
        sharedController = [[self alloc] init];
    }
}

+ (id)sharedInstance {    
    if (sharedController == nil) {
        sharedController = [[self alloc] init];
    }
    
    return sharedController;
}

@end
   
