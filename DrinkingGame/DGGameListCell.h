//
//  DGPlayerStatCell.h
//  DrinkingGame
//
//  Created by student on 3/1/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGGame.h"
@interface DGGameListCell : UITableViewCell{
    IBOutlet UIImageView* gameIcon;
    IBOutlet UILabel* nameLabel;
    DGGame *game;
}

- (void)setGame:(DGGame*) Game;
@end
