//
//  DGPlayer.m
//  DrinkingGame
//
//  Created by student on 1/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DGPlayer.h"


@implementation DGPlayer
@synthesize image, isFemale, promille, waterWeightGram, weight;

- (id)initWithimage:(UIImage*) imageIn weight:(int)weightIn isFemale:(bool) isFemaleIn 
{
    self = [super init];
    if (self) {
        self.image = imageIn;
        self.isFemale = isFemaleIn;
        if(isFemale){
            self.waterWeightGram = [NSNumber numberWithFloat:weightIn*0.63f];
        }else{
            self.waterWeightGram = [NSNumber numberWithFloat:weightIn*0.71f];
        }
        self.promille = [NSNumber numberWithFloat:0.0];
    }
    
    return self;
}

//
// For sorting players according to Drunkness
//
-(NSComparisonResult) comparePromille:(id)element{
    return [((DGPlayer*) element).promille compare:promille];
}

@end
