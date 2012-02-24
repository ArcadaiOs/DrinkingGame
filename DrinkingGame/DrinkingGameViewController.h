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
    NSMutableArray  *views;
    IBOutlet UIView *startView;
    IBOutlet UIView *view_01;
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
    IBOutlet UIView *thirteenthView;
    IBOutlet UIView *fourteenthView;
    IBOutlet UIView *fifteenthView;
    IBOutlet UIView *sixteenthView;
    IBOutlet UIView *seventeenthView;
    IBOutlet UIView *eighteenthView;
    IBOutlet UIView *nineteenthView;
    IBOutlet UIView *twentiethView;
    IBOutlet UIView *twentyfirstView;
    IBOutlet UIView *twentysecondView;
    IBOutlet UIView *twentythirdView;
    IBOutlet UIView *twentyfourthView;
    IBOutlet UIView *twentyfifthView;
    IBOutlet UIView *twentysixthView;
    IBOutlet UIView *twentyseventhView;
    IBOutlet UIView *twentyeightView;
    IBOutlet UIView *twentyninthView;
    IBOutlet UIView *thirtiethView;
    IBOutlet UIView *thirtyfirstView;
    IBOutlet UIView *thirtysecondView;
    IBOutlet UIView *thirtythirdView;
    IBOutlet UIView *endView;
    UIViewController *s;
    int buttonpushed;
    int count;
}
@property (nonatomic, retain) NSMutableArray*views;
@property int penalty;
@property int buttonpushed;
@property(readwrite,retain) UIViewController* s;
@property (nonatomic, retain) UILabel *myCounterLabel;
-(IBAction)Q1:(id)sender;
-(IBAction)win:(id) sender;
-(IBAction)Lose:(id)sender;
-(IBAction)nextPlayer:(id)sender;
@end