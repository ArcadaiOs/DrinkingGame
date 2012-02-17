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
    NSMutableArray *pPoints;
    NSTimer *timer1;
    NSTimer *timer2;
    IBOutlet UIButton *nextPlayer;
    IBOutlet UIButton *mole1;
    IBOutlet UIButton *mole2;
    IBOutlet UIButton *mole3;
    IBOutlet UILabel *scoreLabelText;
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *playerNameText;
    IBOutlet UILabel *playerName;
     IBOutlet UILabel *playerName2;
    IBOutlet UILabel *timeLeftText;
    IBOutlet UILabel *timeLeft;
    IBOutlet UILabel *playerScore;
    IBOutlet UILabel *resultTitle;
    IBOutlet UILabel *playerScores;
    IBOutlet UIView *gameView;
    IBOutlet UIView *startView;
    IBOutlet UIView *endView;
    NSString *zeroes;
    NSString *pName;
    NSMutableString *results;
    int molesShown;
    int molesHit;
    int seconds;
    int maxMoles;
    int playerCount;
    int currentPlayer;
    NSMutableDictionary *points;
    NSArray *nameCollection;
    NSMutableArray *pInfo;
    
}
@property (nonatomic, retain) IBOutletCollection(UILabel) NSArray *nameCollection;
@property(nonatomic,retain) NSMutableDictionary *points;
@property(nonatomic, retain) IBOutlet UIView *gameView;
@property(nonatomic, retain) IBOutlet UIView *startView;
@property(nonatomic, retain) IBOutlet UIView *endView;
@property(nonatomic,retain) NSString *zeroes;
@property(nonatomic,retain) NSString *pName;
@property(nonatomic,retain) NSMutableString *results;
@property(nonatomic,retain) NSTimer *timer1;
@property(nonatomic,retain) NSTimer *timer2;
@property(nonatomic,retain) IBOutlet UILabel *scoreLabelText;
@property(nonatomic,retain) IBOutlet UILabel *scoreLabel;
@property(nonatomic,retain) IBOutlet UILabel *playerNameText;
@property(nonatomic,retain) IBOutlet UILabel *playerName;
@property(nonatomic,retain) IBOutlet UILabel *playerName2;
@property(nonatomic,retain) IBOutlet UILabel *timeLeftText;
@property(nonatomic,retain) IBOutlet UILabel *timeLeft;
@property(nonatomic,retain) IBOutlet UILabel *playerScore;
@property(nonatomic,retain) IBOutlet UILabel *resultTitle;
@property(nonatomic,retain) IBOutlet UILabel *playerScores;
@property int molesHit;
@property int molesShown;
@property int seconds;
@property int maxMoles;
@property int playerCount;
@property int currentPlayer;
@property(nonatomic,retain) IBOutlet UIButton *mole1; 
@property(nonatomic,retain) IBOutlet UIButton *mole2;
@property(nonatomic,retain) IBOutlet UIButton *mole3;
-(IBAction)addScore:(id)sender;
-(IBAction)startGame:(id)sender;
- (IBAction)nextPlayer:(id)sender;
-(void)endTimers;
-(void)setFonts;
-(void)updateInterval:(NSTimer*)theTimer;
-(int) getRandomIntMin:(int) min max:(int) max;
@end
