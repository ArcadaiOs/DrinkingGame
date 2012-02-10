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
    NSTimer *timer1;
    NSTimer *timer2;
    IBOutlet UIButton *mole1;
    IBOutlet UIButton *mole2;
    IBOutlet UIButton *mole3;
    IBOutlet UILabel *scoreLabelText;
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *playerNameText;
    IBOutlet UILabel *playerName;
    IBOutlet UILabel *timeLeftText;
    IBOutlet UILabel *timeLeft;
    IBOutlet UILabel *playerScore;
    NSString *zeroes;
    int molesShown;
    int molesHit;
    int seconds;
    
}
@property(nonatomic,retain) NSArray *speed;
@property(nonatomic,retain) NSString *zeroes;
@property(nonatomic,retain) NSTimer *timer1;
@property(nonatomic,retain) NSTimer *timer2;
@property(nonatomic,retain) IBOutlet UILabel *scoreLabelText;
@property(nonatomic,retain) IBOutlet UILabel *scoreLabel;
@property(nonatomic,retain) IBOutlet UILabel *playerNameText;
@property(nonatomic,retain) IBOutlet UILabel *playerName;
@property(nonatomic,retain) IBOutlet UILabel *timeLeftText;
@property(nonatomic,retain) IBOutlet UILabel *timeLeft;
@property(nonatomic,retain) IBOutlet UILabel *playerScore;
@property int molesHit;
@property int molesShown;
@property int seconds;
@property(nonatomic,retain) IBOutlet UIButton *mole1; 
@property(nonatomic,retain) IBOutlet UIButton *mole2;
@property(nonatomic,retain) IBOutlet UIButton *mole3;
-(IBAction)addScore:(id)sender;
-(void)updateInterval:(NSTimer*)theTimer;
-(int) getRandomIntMin:(int) min max:(int) max;
@end
