//
//  playerStatsCell.h
//  DrinkingGame
//
//  Created by student on 2/24/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGPlayer.h"
@interface DGplayerStatsCell : UITableViewCell{
    DGPlayer* player;
    IBOutlet UIImageView* playerImage;
    IBOutlet UILabel* nameLabel;
    IBOutlet UILabel* promilleLabel;
}
@property (nonatomic, retain) IBOutlet UIImageView* playerImage;
@end
