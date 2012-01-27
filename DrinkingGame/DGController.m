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
        drinks = [[NSArray alloc] arrayWithObjects:
                  [[DGDrink alloc] initWithVolumeCl:2 procent:40 andName:@"Shot"],
                  [[DGDrink alloc] initWithVolumeCl:8 procent:11 andName:@"Wine"],
                  [[DGDrink alloc] initWithVolumeCl:16 procent:4.7f andName:@"Beer"],
                  nil];
        
        // Initialization code here.
    }
    
    return self;
}
@end
