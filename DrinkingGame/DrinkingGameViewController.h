//
//  DrinkingGameViewController.h
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrinkingGameViewController :  UIViewController
{
    
    
        NSInteger gameState;
        NSInteger previousState;
    

    UIImageView *players;
    
    UIButton *btnContinue;
    UIButton *btnBack;
    
    UIButton *btn2;
    UIButton *btn3;
    UIButton *btn4;
    UIButton *btn5;
    UIButton *btn6;
    UIButton *btn7;
    UIButton *btn8;
    
    
}

@property (nonatomic) NSInteger gameState;
@property (nonatomic) NSInteger previousState;



@property (nonatomic, retain) IBOutlet UIButton *btn2;
@property (nonatomic, retain) IBOutlet UIButton *btn3;
@property (nonatomic, retain) IBOutlet UIButton *btn4;
@property (nonatomic, retain) IBOutlet UIButton *btn5;
@property (nonatomic, retain) IBOutlet UIButton *btn6;
@property (nonatomic, retain) IBOutlet UIButton *btn7;
@property (nonatomic, retain) IBOutlet UIButton *btn8;
@property (nonatomic, retain) IBOutlet UIButton *btnContinue;
@property (nonatomic, retain) IBOutlet UIButton *btnBack;

@property (nonatomic, retain) IBOutlet UIImageView *players;

-(IBAction)buttonPressed1;
-(IBAction)buttonClickedContinue;
-(IBAction)buttonClickedBack;

-(IBAction)buttonPressed1;
@end

