//
//  DGRandomShotWheel.h
//  DrinkingGame
//
//  Created by student on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGController.h"
#import "DGPlayer.h"

@interface DGRandomShotWheel : UIView{
    DGController* controller;
}
- (id)initWithFrame:(CGRect)frame andController:(DGController*) controllerIn;

@end
