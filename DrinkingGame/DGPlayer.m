//
//  DGPlayer.m
//  DrinkingGame
//
//  Created by student on 1/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DGPlayer.h"


@implementation DGPlayer
@synthesize image, name, isFemale, waterWeightGram, weight,gramAlcBody,lastUpdate;
@synthesize firstDrink;

- (id)initWithimage:(UIImage*) imageIn name:(NSString*)nameIn weight:(int)weightIn isFemale:(bool) isFemaleIn 
{
    self = [super init];
    if (self) {
        self.lastUpdate = [NSDate date];
        self.image = imageIn;
        self.name = nameIn;
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
    NSLog(@"%@ drank %@",name, shot.name);
    NSNumber *kfb;

    double burn = [[self waterWeightGram] doubleValue];
    if(lastUpdate != nil){
        burn /= [lastUpdate timeIntervalSinceNow];

    }
    if(isFemale){
        kfb = [NSNumber numberWithDouble: (0.085 * [gramAlcBody doubleValue]) / burn];
    }else{
        kfb = [NSNumber numberWithFloat: (0.1 * [gramAlcBody floatValue]) / burn ];
    }

    self.lastUpdate = [NSDate date];
    float n = [kfb floatValue] + [[shot alcCount]floatValue] + [gramAlcBody floatValue];
    [self setGramAlcBody:[NSNumber numberWithFloat:n]];

    NSLog(@"%@ %f %% grams: %f",[self name], [[self getPromille] floatValue], [[self gramAlcBody] floatValue]);
}

-(NSNumber*) getPromille{
    return [NSNumber numberWithFloat:([gramAlcBody floatValue]/[waterWeightGram floatValue])] ;
}

@end
