//
//  DGFillTheBottle.h
//  DrinkingGame
//
//  Created by student on 2/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGGame.h"
#import "DGController.h"

@interface DGFillTheBottle : DGGame {
    UIView *gameView;
    UIView *startView;
    UIView *endView;
    
    UILabel *timerLabel;
    UILabel *timeLabelText;
    UILabel *playerName0;
    UILabel *yourUpNext;
    UILabel *playerName2;
    UILabel *playerScore;
    UILabel *resultTitle;
    UILabel *playerScores;
    
    UIButton *startPlayingBtn;
    UIButton *nextPlayerBtn;
    UIButton *moreButton;
    UIButton *moreButton2;
    
    UIImageView *pilar;
    
    NSTimer *countTimer;
    
    UIImage *btnGreen, *btnRed;
    
    int click;
    int objectHeight;
    int i;
    int timeForGame;
    int currentPlayer;
    int playerCount;
    
    NSMutableDictionary *points;
    NSArray *nameCollection;
    NSMutableArray *pInfo;
    NSString *pName;
    NSMutableString *results;
    
    
}
/*Game objects*/
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
@property int currentPlayer;
@property int playerCount;
@property (nonatomic, retain) IBOutlet NSMutableDictionary *points;
@property (nonatomic, retain) IBOutletCollection(UILabel) NSArray *nameCollection;
@property (nonatomic, retain) IBOutlet NSMutableArray *pInfo;
@property (nonatomic, retain) IBOutlet NSString *pName;
@property (nonatomic, retain) IBOutlet NSMutableString *results;

/*VIEWS*/
@property(nonatomic, retain) IBOutlet UIView *startView;
@property(nonatomic, retain) IBOutlet UIView *gameView;
@property(nonatomic, retain) IBOutlet UIView *endView;

/*LABELS-STARTVIEW*/
@property (nonatomic, retain) IBOutlet UILabel *yourUpNext;
@property (nonatomic, retain) IBOutlet UILabel *playerName0;
/*BUTTONS-STARTVIEW*/
@property (nonatomic, retain) IBOutlet UIButton *startPlayingBtn;

/*LABELS-ENDVIEW*/
@property (nonatomic,retain) IBOutlet UILabel *playerName2;
@property (nonatomic,retain) IBOutlet UILabel *playerScore;
@property (nonatomic,retain) IBOutlet UILabel *resultTitle;
@property (nonatomic,retain) IBOutlet UILabel *playerScores;
/*BUTTONS-ENDVIEW*/
@property (nonatomic, retain) IBOutlet UIButton *nextPlayerBtn;
@property (nonatomic, retain) IBOutlet UIButton *quitPlayingBtn;

-(IBAction)startNextPlayer:(id)sender;
@end