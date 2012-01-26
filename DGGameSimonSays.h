//
//  DGGameTestOne.h
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGGame.h"
#import <stdlib.h>
#import <time.h>

@interface DGGameSimonSays : DGGame{
    IBOutlet UIButton* blueButton;
    IBOutlet UIButton* yellowButton;
    IBOutlet UIButton* redButton;
    IBOutlet UIButton* greenButton;
    
    NSMutableArray* playList;
    NSEnumerator* playEnumerator;
}

@property (nonatomic, retain) NSMutableArray* playList;

-(void) nextPlay: (NSTimer*) timer;

-(int*) nrOfRands:(int) rands minimi:(int) min maximi:(int) max;
-(int) getRandomIntMin:(int) min max:(int) max;

-(void) timerFired: (NSTimer*) timer;

-(IBAction) buttonPressed:(id)sender;

-(IBAction) flashRandomColor:(id)sender;

@end
