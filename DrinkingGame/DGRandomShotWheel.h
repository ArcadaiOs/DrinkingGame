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
    CABasicAnimation* spinAnimation;
}
- (id)initWithFrame:(CGRect)frame andController:(DGController*) controllerIn andSelection:(int) selIn;
-(void) spin:(id) animDelegate;
- (CGPoint) getCirclePoint: (CGFloat) diam pos:(CGPoint) pos angle: (CGFloat) angle;
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag;
@property (readonly, nonatomic) CABasicAnimation* spinAnimation;
@property (readonly, nonatomic) int sel;
@end
