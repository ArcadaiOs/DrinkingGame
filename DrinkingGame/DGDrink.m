//
//  DGDrink.m
//  DrinkingGame
//
//  Created by student on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGDrink.h"

@implementation DGDrink
@synthesize volumeCl;
@synthesize procent;
@synthesize name;

- (id)initWithVolumeCl: (float) volume procent: (float) drinkProcent andName:(NSString*) drinkName
{
    self = [super init];
    if (self) {
        self.volumeCl = [NSNumber numberWithFloat:volume];
        self.procent = [NSNumber numberWithFloat:drinkProcent];
        self.name = drinkName;
    }
    
    return self;
}

@end
