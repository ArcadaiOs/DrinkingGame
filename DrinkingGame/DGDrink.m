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

- (id)initWithVolumeCl: (float) volumeCl procent: (float) procent andName:(NSString*) name
{
    self = [super init];
    if (self) {
        self.volumeCl = [NSNumber numberWithFloat:volumeCl];
        self.procent = [NSNumber numberWithFloat:procent];
        self.name = name;
    }
    
    return self;
}

@end
