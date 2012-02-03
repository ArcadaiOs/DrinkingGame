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

//intake[g]/vv[g] = pb (bara första gången)
//(pb*vv)*vikt[kg]/delta t [h] = pbf (efter förbränning)
//((pbf*vv)+intake)/vv = pb

//promillehalt = svårighetsgrad
// p1 = 1,0‰
// p2 = 1.25‰
// p3 = 1.5‰

//vikt = w (för att kunna räkna ut den teoretiska vattenmängden i kroppen )

//volym% (spritmängd i gram)
// v1 = 4,7% öl 16cl ()
// v2 = 11% vin 8cl ()
// v3 = 40% brännvin 4cl ()


//kön(för att veta vilken av vattenmängds konstanterna man skall använda 0,63 eller 0,71)
// g1 = 0.71
// g2 = 0.63

//glasstorlek = s (Alkoholmatrisen)

//-- Ekvationen till spelarmakaren --//
// MAN => (w*0.71)*1000 = Gram Vatten i en Man (sparas som vv)
// KVINNA => (w*0.63)*1000 = Gram Vatten i en Kvinna (sparas som vv)

// Hämtar spelarens vv och alkoholenhet
// Alkoholenhet/vv = promille i blodet utan förbränning (sparas som pb)

// mata in inmundigad alkohol mängd

//

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
