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

//glasstorlek = s (räknas ut på basis av inmatad data)

//-- Ekvationen --//
// MAN => w*0.71 = KiloVattenienMan(KVM)
// KVINNA => w*0.63 = KiloVattenienKvinna(KVK)
// GRE/(KVM*1000) = P1

// Gram ren etanol i kroppen för att uppnå P1
// GRE = (KVM*1000)*P1

// GRE/10 = 1portion 

// --- Vätskemängden för man och kvinna --- //
//Promillehalten beräknas som antalet gram alkohol i kroppen dividerat med antalet kilo vätska i kroppen och antalet kilo vätska i kroppen beräknas som andelen vätska i kroppen multiplicerat med vikten i kg. Den promillehalt som uppnås beror på kön då kvinnor har mindre andel vätska och mer underhudsfett än män. När promillehalten beräknas för en man kan andelen vätska sättas till cirka 71 % och när promillehalten beräknas för en kvinna kan andelen vätska sättas till cirka 63 %.

//räkna ut vattenmängden i kroppen för en man
//(vikt i kg / 0.71 = vattenmängden i liter)
//ekvation = alkohol/vattenmängd i kroppen


// --- Förbränningen av alkohol --- //
//Förbränningen av alkohol i gram per timme beror på kön då en man förbränner cirka 0,1 gram ren alkohol per kilo och timme medan en kvinna förbränner cirka 0,085 gram ren alkohol per kilo och timme.



//-- Alkoholmatrisen --//
//  40%  12%  5%        100%
//  1cl  4cl  0.5dl
//  2cl  8cl  1dl
//  4cl  16cl 2dl       1,8cl

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

// --- Ren alkohol per shot --- //
//Enheten för alkoholhalt i drycker har varierat. Tidigare har både viktprocent och °proof använts. Nu använder dom flesta nationer volymprocent som enhet. För att räkna ut hur mycket alkohol olika drycker innehåller kan man använda följande formel:

//Volymprocent * innehåll i centiliter / alkoholhalt man vill jämföra med.
//Så om man vill räkna ut hur mycket 40-procentig alkohol 50 cl folköl med en alkoholhalt på 3,5 volymprocent motsvarar ser det ut så här:
//(3,5 * 50) / 40 = 4,375.
//En folköl innehåller alltså motsvarande 4,375 cl 40-procentig alkohol. Enligt samma formel innehåller några vanliga varianter av berusningsmedel dessa mängder alkohol:
//50 cl 5,2-procentig starköl innehåller 2,6 cl etanol, vilket motsvarar 6,5 cl 40-procentig alkohol.
//75 cl 12-procentigt vin innehåller 9 cl etanol, vilket motsvarar 22,5 cl 40-procentig alkohol.
//50 cl 4,5-procentig starkcider innehåller 2,25 cl etanol, vilket motsvarar 5,625 cl 40-procentig alkohol.
//50 cl 7,0-procentig starkcider innehåller 3,5 cl etanol, vilket motsvarar 8,75 cl 40-procentig alkohol.

@end
