//
//  DrinkingGameViewController.h
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrinkingGameViewController : UIViewController{
    NSTimer *timer;
    IBOutlet UILabel *myCounterLabel;
    
}
@property (nonatomic, retain) UILabel *myCounterLabel;

-(IBAction)Q2;
-(IBAction)Lose;

@end
