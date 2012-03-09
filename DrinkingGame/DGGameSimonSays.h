//
//  DGGameTestOne.h
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGGame.h"
#import "DrinkingGameViewController.h"
#import <stdlib.h>
#import <time.h>

@interface DGGameSimonSays : DGGame{
    IBOutlet UIButton* blueButton;
    IBOutlet UIButton* yellowButton;
    IBOutlet UIButton* redButton;
    IBOutlet UIButton* greenButton;
    
    IBOutlet UIImageView* playerImage;
    
    NSMutableArray* playList;
    NSEnumerator* playEnumerator;
    
    Boolean playerAction;
    NSTimer* playActionTimeOut;
    int playCount;
    int currentPlayer;
}

@property (nonatomic, retain) NSMutableArray* playList;
@property (readwrite, retain) NSEnumerator* playEnumerator;

-(int) colorToIntId:(NSString* )colorName;
-(void) nextPlay: (NSTimer*) timer;
-(void) flashButton:(int) buttonNr duration:(float) seconds;

-(int*) nrOfRands:(int) rands minimi:(int) min maximi:(int) max;
-(int) getRandomIntMin:(int) min max:(int) max;

-(void) timerFired: (NSTimer*) timer;
-(IBAction)next:(id)sender;
-(IBAction) buttonPressed:(id)sender;

-(IBAction) flashRandomColor:(id)sender;
-(IBAction) startGame:(id)sender;


@end
