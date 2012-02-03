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
- (id)init
{
    self = [super init];
    if (self) {
        drinks = [[NSMutableArray alloc] init];
        [drinks addObject:[[DGDrink alloc] initWithVolumeCl:2 procent:40 andName:@"Shot"]];
        [drinks addObject:[[DGDrink alloc] initWithVolumeCl:8 procent:11 andName:@"Wine"]];
        [drinks addObject:[[DGDrink alloc] initWithVolumeCl:16 procent:4.7f andName:@"Beer"]];
        
        players = [[NSMutableArray alloc] init];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"Soini.jpeg"] weight:120 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"niini.png"] weight:80 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"naama.jpg"] weight:80 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"hannibal.jpg"] weight:80 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"haddock.jpg"] weight:80 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"norris.jpg"] weight:80 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"naama2.jpg"] weight:80 isFemale:false]];
        
        // Initialization code here.
    }
    
    return self;
}

@end
