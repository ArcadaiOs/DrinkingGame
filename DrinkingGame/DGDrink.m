//
//  DGDrink.m
//  DrinkingGame
//
//  Created by student on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DGDrink.h"
#import "DGPlayer.h"


@implementation DGDrink
@dynamic volumeCentiLiter;
@dynamic alcoholeProcent;
@dynamic player;
-(float)getAlcoholeContent{
    return [self.volumeCentiLiter floatValue] * ([self.alcoholeProcent floatValue]/100);
}
@end
