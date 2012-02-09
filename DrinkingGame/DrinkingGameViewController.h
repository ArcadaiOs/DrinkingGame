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
    NSUInteger time;
    IBOutlet UIView *firstView;
    IBOutlet UIView *secondView;
    IBOutlet UIView *thirdView;
    UIViewController *s;
}
@property(readwrite,retain) UIViewController* s;
@property (nonatomic, retain) UILabel *myCounterLabel;
-(IBAction)Q2:(id) sender;
-(IBAction)Lose;
@end