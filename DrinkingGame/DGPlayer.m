//
//  DGPlayer.m
//  DrinkingGame
//
//  Created by student on 1/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DGPlayer.h"


@implementation DGPlayer
@synthesize image, isFemale, waterWeightGram, weight,gramAlcBody;
@synthesize promille;
@synthesize lastUpdate;

- (id)initWithimage:(UIImage*) imageIn weight:(int)weightIn isFemale:(bool) isFemaleIn 
{
    self = [super init];
    if (self) {
        self.image = imageIn;
        self.isFemale = isFemaleIn;
        if(isFemaleIn){
            self.waterWeightGram = [NSNumber numberWithFloat:weightIn*0.63f];
        }else{
            self.waterWeightGram = [NSNumber numberWithFloat:weightIn*0.71f];
        }
        self.gramAlcBody = [NSNumber numberWithFloat:0.0];
    }
    
    return self;
}

//
// For sorting players according to Drunkness
//
-(NSComparisonResult) comparePromille:(id)element{
    return [((DGPlayer*) element).promille compare:promille];
}

- (NSNumber*) promilleForPlayer:(DGPlayer*)player newShot:(NSNumber*) gramAlc{
    NSNumber *kfb;
    lastUpdate = [NSDate date];
    if ([player.gramAlcBody intValue] > 0) {
        
        double burn  =  ( [weight doubleValue] / [lastUpdate timeIntervalSinceNow] ) ;
        
//        if(player.isFemale == isFemale){  WTF!!!!!11!!!!! xD
        if(player.isFemale){
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
