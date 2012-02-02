//
//  DGTestGame.m
//  DrinkingGame
//
//  Created by student on 1/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGTestGame.h"
#import "DGTestGameView.h"

@implementation DGTestGame

- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"TESTGAME");
        // Initialization code here.
        name = @"Hattar";
        type = turnBased;
        myView = [[DGTestGameView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        [myController setView:myView];
    }
    
    return self;
}

@end
