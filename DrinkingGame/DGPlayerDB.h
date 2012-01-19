//
//  DGPlayerDB.h
//  DrinkingGame
//
//  Created by student on 1/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DGPlayerDB : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSNumber * alcoholQuantity;
@property (nonatomic, retain) NSString * gender;
@property (nonatomic, retain) NSData * picture;
@property (nonatomic, retain) NSString * name;

@end
