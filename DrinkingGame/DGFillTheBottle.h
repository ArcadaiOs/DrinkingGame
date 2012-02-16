//
//  DGFillTheBottle.h
//  DrinkingGame
//
//  Created by student on 2/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGGame.h"

@interface DGFillTheBottle : DGGame {
    UILabel *countLabel;
    UIButton *moreButton;
    UIImageView *pilar;
    int click;
    int objectHeight;
    UIButton *moreButton2;
}

@property (nonatomic, retain) IBOutlet UILabel *countLabel;
@property int click;
@property int objectHeight;
@property (nonatomic, retain) IBOutlet UIButton *moreButton;
@property (nonatomic, retain) IBOutlet UIButton *moreButton2;
@property (nonatomic, retain) IBOutlet UIImageView *pilar;

@end