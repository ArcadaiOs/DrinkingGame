//
//  DGPlayerStatCell.h
//  DrinkingGame
//
//  Created by student on 3/1/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGPlayer.h"
@interface DGPlayerStatCell : UITableViewCell{
    IBOutlet UIImageView* playerImage;
    IBOutlet UILabel* nameLabel;
    IBOutlet UILabel* promilleLabel;
    IBOutlet UILabel* promilleBar;
    DGPlayer* player;
}
- (void)setPlayer:(DGPlayer*) playerIn;
@end
