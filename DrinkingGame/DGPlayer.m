//
//  DGPlayer.m
//  DrinkingGame
//
//  Created by student on 1/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//  min push

#import "DGPlayer.h"
#import "DGConsumption.h"


@implementation DGPlayer
@synthesize image, isFemale, promille, waterWeightGram, weight;
- (id)initWithimage:(UIImage*) image weight:(int)weight isFemale:(bool) isFemale
{
    self = [super init];
    if (self) {
        self.image = image;
        self.isFemale = isFemale;
        if(isFemale){
            self.waterWeightGram = [NSNumber numberWithFloat:weight*0.63f];
        }else{
            self.waterWeightGram = [NSNumber numberWithFloat:weight*0.71f];
        }
        self.promille = [NSNumber numberWithFloat:0.0];
        // Initialization code here.
    }
    
    return self;
}

@end
