//
//  DGConsumption.h
//  DrinkingGame
//
//  Created by student on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DGPlayer;

@interface DGConsumption : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * alcoholeGrams;
@property (nonatomic, retain) NSDate * timestamp;
@property (nonatomic, retain) DGPlayer *player;

@end
