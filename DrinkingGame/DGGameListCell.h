//
//  DGGameListCell.h
//  DrinkingGame
//
//  Created by student on 3/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGGame.h"

@interface DGGameListCell : UITableViewCell{
    IBOutlet UILabel *GameName;
    DGGame *_Game;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier Game:(DGGame*) Game;

-(void) setGame:(DGGame*) Game;

@end
