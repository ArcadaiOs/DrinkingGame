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
        
        //[[players objectAtIndex:0] setPromille:[NSNumber numberWithFloat:1.0]];
        //[[players objectAtIndex:1] setPromille:[NSNumber numberWithFloat:2.0]];
        //[[players objectAtIndex:2] setPromille:[NSNumber numberWithFloat:0.5]];
        
        
        // Initialization code here.
    }
    
    return self;
}
- (id)addPlayerWithimage:(UIImage*) imageIn weight:(int)weightIn isFemale:(bool) isFemaleIn{
    [players addObject:[[DGPlayer alloc] initWithimage:imageIn weight:weightIn isFemale:isFemaleIn]];
}
@end
