//
//  DGGame.m
//  DrinkingGame
//
//  Created by student on 1/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGGame.h"

@implementation DGGame

-(id) startGameWithController:(DrinkingGameViewController *)controller{
    self = [super init];
    if (self) {
        // Initialization code here.
        myController = controller;
        NSLog(@"gamewithcontroller");
        [self init];
    }
    
    return self;
    
}
-(void) endGame{

}
@end
