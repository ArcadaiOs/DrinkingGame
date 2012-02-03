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

- (id)initWithVolumeCl: (float) volumeClIn procent: (float) procentIn andName:(NSString*) nameIn
{
    self = [super init];
    if (self) {
        self.volumeCl = [NSNumber numberWithFloat:volumeClIn];
        self.procent = [NSNumber numberWithFloat:procentIn];
        self.name = nameIn;
    }
    
    return self;
}

@end
