//
//  DGPlayer.h
//  DrinkingGame
//
//  Created by student on 1/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DGConsumption;

@interface DGPlayer : NSObject {
@private
    NSMutableString *playerName;
    UIImage * image;
    Boolean isFemale;
    NSNumber * promille;
    NSNumber * waterWeightGram;
    NSNumber * weight;
    NSMutableArray* consumptions;
}
@property (nonatomic, retain) UIImage * image;
@property (nonatomic, retain) NSMutableString *playerName;
@property (nonatomic) Boolean isFemale;
@property (nonatomic, retain) NSNumber * promille;
@property (nonatomic, retain) NSNumber * waterWeightGram;
@property (nonatomic, retain) NSNumber * weight;
- (id)initWithimage:(UIImage*) image weight:(int)weight isFemale:(bool) isFemale;
@end
