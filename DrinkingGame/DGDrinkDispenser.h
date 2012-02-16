//
//  DGDrinkDispenser.h
//  DrinkingGame
//
//  Created by student on 2/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGPlayer.h"

@interface DGDrinkDispenser : UIViewController{
    IBOutlet UIImageView *playerImg;
    
    IBOutlet UIView *playerFrame;
    IBOutlet UIView *nextPlayerFrame;
    IBOutlet UIView *nextPlayerFramePlayer;
    
    
}


-(void) showLooser:(DGPlayer *)looser;


@end
