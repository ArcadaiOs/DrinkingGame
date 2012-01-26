//
//  DGPlayer.h
//  DrinkingGame
//
//  Created by student on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DGPlayer : NSManagedObject {
@private
}
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSNumber * weight;
@property (nonatomic, retain) NSNumber * isFemale;

@end
