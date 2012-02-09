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
        [drinks addObject:[[DGDrink alloc] initWithVolumeCl:16 procent:4.7 andName:@"Beer"]];
        
        players = [[NSMutableArray alloc] init];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"Soini.jpeg"] weight:120 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"niini.png"] weight:80 isFemale:false]];
        [players addObject:[[DGPlayer alloc] initWithimage:[UIImage imageNamed:@"naama.jpg"] weight:80 isFemale:false]];
        
        [[players objectAtIndex:0] takeShot:[drinks objectAtIndex:1]];
        [[players objectAtIndex:1] takeShot:[drinks objectAtIndex:0]];
        [[players objectAtIndex:2] takeShot:[drinks objectAtIndex:2]];
        [[players objectAtIndex:2] takeShot:[drinks objectAtIndex:2]];
        
    }
    
    return self;
} 
-(void) GameEndedWithLooser:(DGPlayer *)looser{
    NSLog(@"GAME ENDED AND LOOSER IS FOUND");
    
    
}
@end
