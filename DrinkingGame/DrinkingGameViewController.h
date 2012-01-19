//
//  DrinkingGameViewController.h
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef struct{
    NSString *playerName;
    int score;
} score;

@interface DrinkingGameViewController : UIViewController


-(void) gameEndedWithScores:(NSString*) scores;

@end
