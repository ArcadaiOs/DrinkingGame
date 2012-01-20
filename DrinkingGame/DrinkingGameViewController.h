//
//  DrinkingGameViewController.h
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGGame.h"
#import "DGGameTestOne.h"


typedef struct{
    NSString *playerName;
    int score;
} score;

@interface DrinkingGameViewController : UIViewController{
    DGGame *currentCame;
    
    
}


-(void) gameEndedWithScores:(NSString*) scores;
-(IBAction) launchTestGame:(id)sender;
@end
