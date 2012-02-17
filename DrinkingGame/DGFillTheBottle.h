//
//  DGFillTheBottle.h
//  DrinkingGame
//
//  Created by student on 2/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGGame.h"

@interface DGFillTheBottle : DGGame {
    UILabel *timerLabel;
    UILabel *timeLabelText;
    UIButton *moreButton;
    UIImageView *pilar;
    int click;
    int objectHeight;
    int i;
    int timeForGame;
    UIButton *moreButton2;
    NSTimer *countTimer;
    UIImage *btnGreen, *btnRed;
    UIAlertView *startGame;
}

@property (nonatomic, retain) IBOutlet UILabel *timerLabel;
@property (nonatomic, retain) IBOutlet UILabel *timeLabelText;
@property int click;
@property int objectHeight;
@property (nonatomic, retain) IBOutlet UIButton *moreButton;
@property (nonatomic, retain) IBOutlet UIButton *moreButton2;
@property (nonatomic, retain) IBOutlet UIImageView *pilar;
@property (nonatomic, retain) NSTimer *countTimer;
@property (nonatomic, retain) UIImage *btnGreen;
@property (nonatomic, retain) UIImage *btnRed;

@end