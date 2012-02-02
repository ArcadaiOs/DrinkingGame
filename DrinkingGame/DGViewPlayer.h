//
//  DGViewPlayer.h
//  DrinkingGame
//
//  Created by student on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGPlayer.h"

@interface DGViewPlayer : UIViewController{
    IBOutlet UIImageView *playerImage; 
    IBOutlet UILabel *promilLabel;
}

-(void) setPlayer:(DGPlayer*) newPlayer;

-(IBAction) done:(id)sender;

@end
