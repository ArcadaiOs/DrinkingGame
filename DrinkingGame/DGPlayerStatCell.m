//
//  DGPlayerStatCell.m
//  DrinkingGame
//
//  Created by student on 3/1/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGPlayerStatCell.h"
#define PROMILLE_OF_DEATH (1.5)

@implementation DGPlayerStatCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setPlayer:(DGPlayer*) playerIn{
    player = playerIn;
    playerImage.image = player.image;
    nameLabel.text = player.name;
    promilleLabel.text = [player.getPromille stringValue];
    float fullness = ([player.getPromille floatValue] / PROMILLE_OF_DEATH);
    promilleBar.frame = CGRectMake(80., 42., 240. * fullness, 17.);
    UIFont *rockwell = [UIFont fontWithName:@"Rockwell Extra Bold" size:35];
    [nameLabel setFont:rockwell];
}
@end
