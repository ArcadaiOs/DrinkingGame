//
//  DGRandomShot.h
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGGame.h"
#import "DGController.h"
#import "DGRandomShotWheel.h"
#import <QuartzCore/QuartzCore.h>
@interface DGRandomShot : DGGame{
    IBOutlet UIImageView* img;
    IBOutlet DGRandomShotWheel* rotaView;
}

@end
