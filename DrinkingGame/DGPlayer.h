//
//  DGPlayer.h
//  DrinkingGame
//
//  Created by student on 1/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "DGDrink.h"

@class DGConsumption;

@interface DGPlayer : NSObject {
@private
    NSString * name;
    UIImage * image;
    Boolean isFemale;
    NSNumber * waterWeightGram;
    NSNumber * weight;
    NSDate * lastUpdate;
    NSMutableArray* consumptions;
    NSNumber * gramAlcBody;
    NSDate *firstDrink;
}
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) UIImage * image;
@property (nonatomic) Boolean isFemale;
@property (nonatomic, retain) NSNumber * waterWeightGram;
@property (nonatomic, retain) NSNumber * weight;
@property (nonatomic, retain) NSDate * lastUpdate;
@property (nonatomic, retain) NSNumber * gramAlcBody;
@property (nonatomic, retain) NSDate * firstDrink;

- (id)initWithimage:(UIImage*) imageIn name:(NSString*)nameIn weight:(int)weightIn isFemale:(bool) isFemaleIn;
-(NSComparisonResult) comparePromille:(id) element; 
- (void) takeShot:(DGDrink*) gramAlc;
-(NSNumber*) getPromille;
@end
