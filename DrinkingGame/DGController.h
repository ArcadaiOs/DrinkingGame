//
//  DGController.h
//  DrinkingGame
//
//  Created by student on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DGDrink.h"
@interface DGController : NSObject{
    NSArray* drinks;
    NSArray* players;
}

@property (nonatomic, retain) NSArray* drinks;
@property (nonatomic, retain) NSArray* players;
@end
