//
//  playerStatsCell.m
//  DrinkingGame
//
//  Created by student on 2/24/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGplayerStatsCell.h"

@implementation DGplayerStatsCell
-(id)initWithPlayer: (DGPlayer*) player_{
    self = [super init];
    if (self) {
        player = player_;
        playerImage.image = player.image;
    }
    return self;
}
@end
