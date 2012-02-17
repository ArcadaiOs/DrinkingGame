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
    IBOutlet UIView *fourthView;
    IBOutlet UIView *fifthView;
    IBOutlet UIView *sixthView;
    IBOutlet UIView *seventhView;
    IBOutlet UIView *eightView;
    IBOutlet UIView *ninthView;
    IBOutlet UIView *tenthView;
    IBOutlet UIView *eleventhView;
    IBOutlet UIView *twelfthView;
    IBOutlet UIView *endView;
    UIViewController *s;
    int buttonpushed;
    int count;
}
@property int count;
@property int buttonpushed;
@property(readwrite,retain) UIViewController* s;
@property (nonatomic, retain) UILabel *myCounterLabel;
-(IBAction)Q1:(id)sender;
-(IBAction)Q2:(id) sender;
-(IBAction)Lose:(id)sender;
@end