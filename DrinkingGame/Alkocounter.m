//
//  Alkocounter.m
//  DrinkingGame
//
//  Created by Jens Klemets on 1/13/12.
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
// --- Variabler --- //

//promillehalt = svårighetsgrad
// p1 = 1,0‰
// p2 = 1.5‰
// p3 = 2.0‰

//vikt = w (för att kunna räkna ut den teoretiska vattenmängden i kroppen )

//volym% (spritsort)
// v1 = 5% öl
// v2 = 12% vin
// v3 = 40% brännvin

//kön(för att veta vilken av vattenmängds konstanterna man skall använda 0,63 eller 0,71)
// g1 = 0.71
// g2 = 0.63

//glasstorlek = s (Alkoholmatrisen)

//-- Ekvationen --//
// MAN => w*0.71 = KiloVattenienMan(KVM)
// KVINNA => w*0.63 = KiloVattenienKvinna(KVK)
// GRE/(KVM*1000) = P1

// Gram ren etanol i kroppen för att uppnå P1
// GRE = (KVM*1000)*P1

// Räkna hur stor portionen skall för en person
// GRE/10 = port (1 portion)

// Kolla den närmaste glass storleken


// mata in inmundigad alkohol mängd

//-- Alkoholmatrisen --//
//  40%  12%  5%        100%
//  1cl  4cl  0.5dl
//  2cl  8cl  1dl
//  4cl  16cl 2dl       


// --- Förbränningen av alkohol --- //
//Förbränningen av alkohol i gram per timme beror på kön då en man förbränner cirka 0,1 gram ren alkohol per kilo och timme medan en kvinna förbränner cirka 0,085 gram ren alkohol per kilo och timme.




// --- Fun facts --- //
//0,2 - Värmekänsla, avspänning, gränsen för rattfylleri.
//0,5 - Upprymdhet. Hämningarna minskar, försämrad koordination.
//0,8 - Högljudd, överdrivna rörelser, hämningslös, luktar alkohol.
//Normalkonsumenter slutar oftast dricka senast vid detta promilletal.
//1,0 - Sluddrigt tal. Påtagligt förlängd reaktionstid. Gränsen för grovt rattfylleri.
//1,5 - Påtagligt berusad. Raglar. Kräkningar.
//2,0 - Dubbelseende. Svårt att prata och gå. Kan orsaka minneslucka.
//3,0 - Gräns till medvetslöshet.
//4,0 - Medvetslöshet. Långsam andning. Risk för död p.g.a. alkoholförgiftning.

@end
