//
//  Q2ViewController.h
//  DrinkingGame
//
//  Created by student on 1/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Q2ViewController : UIViewController{
    NSTimer *timer;
    IBOutlet UILabel *myCounterLabel;
    NSUInteger time;
}

@property (nonatomic, retain) UILabel *myCounterLabel;
-(IBAction)Q3;
-(IBAction)Lose;

@end
