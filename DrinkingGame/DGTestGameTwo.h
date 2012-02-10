//
//  DGTestGameTwo.h
//  DrinkingGame
//
//  Created by student on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGGame.h"
#import "DGController.h"

@interface DGTestGameTwo : DGGame{
    NSArray *speed;
    IBOutlet UIButton *mole1;
    IBOutlet UIButton *mole2;
    IBOutlet UIButton *mole3;
    IBOutlet UILabel *scoreLabelText;
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *playerNameText;
    IBOutlet UILabel *playerName;
    IBOutlet UILabel *timeLeftText;
    IBOutlet UILabel *timeLeft;
    NSMutableString *zeroes;
    int score;
    int seconds;
    
}
@property(nonatomic,retain) NSArray *speed;
@property(nonatomic,retain) NSMutableString *zeroes;
@property(nonatomic,retain) IBOutlet UILabel *scoreLabelText;
@property(nonatomic,retain) IBOutlet UILabel *scoreLabel;
@property(nonatomic,retain) IBOutlet UILabel *playerNameText;
@property(nonatomic,retain) IBOutlet UILabel *playerName;
@property(nonatomic,retain) IBOutlet UILabel *timeLeftText;
@property(nonatomic,retain) IBOutlet UILabel *timeLeft;
@property int score;
@property int seconds;
@property(nonatomic,retain) IBOutlet UIButton *mole1; 
@property(nonatomic,retain) IBOutlet UIButton *mole2;
@property(nonatomic,retain) IBOutlet UIButton *mole3;
-(IBAction)addScore:(id)sender;
-(void)updateInterval:(NSTimer*)theTimer;
-(int) getRandomIntMin:(int) min max:(int) max;
@end
