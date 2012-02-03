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
    IBOutlet UILabel *scoreLabel;
    int score;
}
@property(nonatomic,assign) NSArray *speed;
@property(nonatomic,assign) IBOutlet UILabel *scoreLabel;
@property int score;
@property(nonatomic,retain) IBOutlet UIButton *mole1; 
@property(nonatomic,retain) IBOutlet UIButton *mole2;
@property(nonatomic,retain) IBOutlet UIButton *mole3;
-(IBAction)addScore:(id)sender;
-(void)updateInterval:(NSTimer*)theTimer;
-(int) getRandomIntMin:(int) min max:(int) max;
@end
