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
@interface DGController : NSObject{
    NSMutableArray* drinks;
    NSMutableArray* players;
}

@property (nonatomic, retain) NSMutableArray* drinks;
@property (nonatomic, retain) NSMutableArray* players;
//-(void) addPlayer;
@end
