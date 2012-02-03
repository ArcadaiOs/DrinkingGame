//
//  DGPlayer.m
//  DrinkingGame
//
//  Created by student on 1/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DGPlayer.h"


@implementation DGPlayer
@synthesize image, isFemale, gramAlcBody, waterWeightGram, weight, lastUpdate, playerName;
- (id)initWithimage:(UIImage*) playerImage weight:(int)playerWeight isFemale:(bool) isPlayerFemale
{
    self = [super init];
    if (self) {
        self.image = playerImage;
        self.isFemale = isPlayerFemale;
        if(isPlayerFemale){
            self.waterWeightGram = [NSNumber numberWithFloat:playerWeight*0.63f];
        }else{
            self.waterWeightGram = [NSNumber numberWithFloat:playerWeight*0.71f];
        }
        self.gramAlcBody = [NSNumber numberWithFloat:0.0];
    }
    
    return self;
}

- (NSNumber*) promilleForPlayer:(DGPlayer*)player newShot:(NSNumber*) gramAlc{
    NSNumber *kfb;
    lastUpdate = [NSDate date];
    if ([player.gramAlcBody intValue] > 0) {
        
        double burn  =  ( [weight doubleValue] / [lastUpdate timeIntervalSinceNow] ) ;
        
        if(player.isFemale == isFemale){
            
            kfb = [NSNumber numberWithDouble: (0.085 * [gramAlcBody doubleValue]) / burn];
        }else{
            kfb = [NSNumber numberWithFloat: (0.1 * [gramAlcBody floatValue]) / burn ];
        }
    }
    int newGram = [kfb intValue] + [gramAlc intValue];
    player.gramAlcBody = [NSNumber numberWithInt:newGram];
    
    
    return kfb; 
}
@end
