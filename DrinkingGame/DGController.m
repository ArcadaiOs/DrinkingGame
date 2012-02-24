//
//  DGController.m
//  DrinkingGame
//
//  Created by student on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGController.h"

@implementation DGController
@synthesize drinks;
@synthesize players;
@synthesize gameLevel,playerCount;
@synthesize delegate;
@synthesize drinkar;

//@synthesize controller;
- (id)init
{
    self = [super init];
    if (self) {
        drinks = [[NSMutableArray alloc] init];
        [drinks addObject:[[DGDrink alloc] initWithVolumeCl:2 procent:40 andName:@"Shot"]];
        [drinks addObject:[[DGDrink alloc] initWithVolumeCl:8 procent:11 andName:@"Wine"]];
        [drinks addObject:[[DGDrink alloc] initWithVolumeCl:16 procent:4.7 andName:@"Beer"]];
        
        
        //drinkar = [[NSDictionary alloc] init];

//        [drinkar setValue:[[DGDrink alloc] initWithVolumeCl:2 procent:40 andName:@"Shot"] forKey:@"Shot"];
//        [drinkar setValue:[[DGDrink alloc] initWithVolumeCl:8 procent:11 andName:@"Wine"] forKey:@"Wine"];
//        [drinkar setValue:[[DGDrink alloc] initWithVolumeCl:16 procent:4.7 andName:@"Beer"] forKey:@"Beer"];
 
        drinkar = [NSDictionary dictionaryWithObjectsAndKeys:
                   [[DGDrink alloc] initWithVolumeCl:2 procent:40 andName:@"Shot"],
                   @"Shot", 
                   [[DGDrink alloc] initWithVolumeCl:8 procent:11 andName:@"Wine"],
                   @"Wine", 
                   [[DGDrink alloc] initWithVolumeCl:16 procent:4.7 andName:@"Beer"],
                   @"Beer", 
                   nil];
        
        NSLog(@"ASD: %@", ((DGDrink*)[drinkar valueForKey:@"Beer"]).name);
        
        players = [[NSMutableArray alloc] init];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"Soini.jpeg"] name:@"Soini" weight:120 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"niini.png"] name:@"Niini" weight:80 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"naama.jpg"] name:@"Naama" weight:80 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"haddock.jpg"] name:@"Haddock" weight:80 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"poirot.jpg"] name:@"Poirot" weight:80 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"norris.jpg"] name:@"Norris" weight:80 isFemale:false]];
        playerCount = [players count];

        
        
        //        [[players objectAtIndex:0] takeShot:[drinks objectAtIndex:1]];
        //        [[players objectAtIndex:1] takeShot:[drinks objectAtIndex:0]];
        //        [[players objectAtIndex:2] takeShot:[drinks objectAtIndex:2]];
        //        [[players objectAtIndex:2] takeShot:[drinks objectAtIndex:2]];
        
    }
    
    return self;
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
-(void) playerReady{
    NSLog(@"PLAYER READu CONTROLER");
}
- (void) startRandomGame{
    // TALK TO DrinkingGameViewController
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
   
