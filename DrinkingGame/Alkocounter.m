//
//  Alkocounter.m
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Alkocounter.h"
@implementation Alkocounter

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

// --- Vätskemängden för man och kvinna --- //
//Promillehalten beräknas som antalet gram alkohol i kroppen dividerat med antalet kilo vätska i kroppen och antalet kilo vätska i kroppen beräknas som andelen vätska i kroppen multiplicerat med vikten i kg. Den promillehalt som uppnås beror på kön då kvinnor har mindre andel vätska och mer underhudsfett än män. När promillehalten beräknas för en man kan andelen vätska sättas till cirka 71 % och när promillehalten beräknas för en kvinna kan andelen vätska sättas till cirka 63 %.

//räkna ut vattenmängden i kroppen för en man
//(vikt i kg / 0.71 = vattenmängden i liter)
//ekvation = alkohol/vattenmängd i kroppen


//räkna ut vattenmängden i kroppen för en kvinna
//vikt i kg / 0.63 = vattenmängden i liter
//räkna ut alkoholmängden i kroppen för en kvinna

// --- Ren alkohol per shot --- //
//antalet gram ren alkohol per varje enhet av dricka utifrån volymprocent, antal centiliter och alkoholens densitet

// --- Förbränningen av alkohol --- //
//Förbränningen av alkohol i gram per timme beror på kön då en man förbränner cirka 0,1 gram ren alkohol per kilo och timme medan en kvinna förbränner cirka 0,085 gram ren alkohol per kilo och timme.


@end
