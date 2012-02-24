//
//  DGViewPlayer.h
//  DrinkingGame
//
//  Created by student on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGPlayer.h"

@protocol PlayerAcknowledged <NSObject>
    -(void) playerReady;
@end


@interface DGViewPlayer : UIViewController{
    IBOutlet UIImageView *playerImage; 
    IBOutlet UILabel *promilLabel;
    id < PlayerAcknowledged > delegate;
}

@property(nonatomic,assign)id delegate;

-(void) setPlayer:(DGPlayer*) newPlayer;

-(IBAction) done:(id)sender;



@end


