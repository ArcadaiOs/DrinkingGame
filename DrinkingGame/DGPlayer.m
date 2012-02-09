//
//  DGPlayer.m
//  DrinkingGame
//
//  Created by student on 1/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DGPlayer.h"


@implementation DGPlayer
@synthesize image, isFemale, waterWeightGram, weight,gramAlcBody,lastUpdate;

- (id)initWithimage:(UIImage*) imageIn weight:(int)weightIn isFemale:(bool) isFemaleIn 
{
    self = [super init];
    if (self) {
        lastUpdate = [NSDate date];
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
    return [[((DGPlayer*) element) getPromille] compare:[self getPromille]];
}


- (void) takeShot:(DGDrink*) shot{
    NSNumber *kfb;
    //förbränning
    if ([gramAlcBody intValue] > 0) {
        
        double burn  =  ( [weight floatValue] / [lastUpdate timeIntervalSinceNow] ) ;
        
        if(isFemale){
            kfb = [NSNumber numberWithFloat: (0.085 * [gramAlcBody floatValue]) / burn];
        }else{
            kfb = [NSNumber numberWithFloat: (0.1 * [gramAlcBody floatValue]) / burn ];
        }
    }
    lastUpdate = [NSDate date];
    int newGram = [kfb intValue] + [gramAlc intValue];
    gramAlcBody = [NSNumber numberWithInt:newGram];
}
-(NSNumber*) getPromille{
    return [NSNumber numberWithFloat:([gramAlcBody floatValue]/[waterWeightGram floatValue])] ;
}

@end
