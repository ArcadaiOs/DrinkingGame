//
//  DGDrink.h
//  DrinkingGame
//
//  Created by student on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DGPlayer;

@interface DGDrink : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * volumeCentiLiter;
@property (nonatomic, retain) NSNumber * alcoholeProcent;
@property (nonatomic, retain) DGPlayer *player;
-(float)getAlcoholeContent;
@end
