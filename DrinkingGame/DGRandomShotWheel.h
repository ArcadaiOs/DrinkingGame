//
//  DGRandomShotWheel.h
//  DrinkingGame
//
//  Created by student on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DGController.h"
#import "DGPlayer.h"

@interface DGRandomShotWheel : UIView{
    DGController* controller;
    int sel;
    int count;
    CGFloat step;
}
- (id)initWithFrame:(CGRect)frame andController:(DGController*) controllerIn andSelection:(int) selIn;
-(void) spin;
- (CGPoint) getCirclePoint: (CGFloat) diam pos:(CGPoint) pos angle: (CGFloat) angle;
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag;
@end
