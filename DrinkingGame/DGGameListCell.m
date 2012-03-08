//
//  DGGameListCell.m
//  DrinkingGame
//
//  Created by student on 3/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGGameListCell.h"

@implementation DGGameListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;

}
-(void) setGame:(DGGame *)Game{
    _Game = Game;
    GameName.text = [_Game name];
}

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier Game:(DGGame *)Game{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _Game = Game;
        GameName.text = [_Game name];
    }
    return self;

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
