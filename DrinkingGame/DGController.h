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
    int gameLevel;
}

-(void) GameEndedWithLooser:(DGPlayer*) looser;


@property (nonatomic, retain) NSMutableArray* drinks;
@property (nonatomic, retain) NSMutableArray* players;
@property int gameLevel;

- (void)addPlayerWithimage:(UIImage*) imageIn weight:(int)weightIn isFemale:(bool) isFemaleIn;
+ (id) sharedInstance;
- (void) startRandomGame;
@end
