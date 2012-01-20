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
    
    IBOutlet UIPickerView *singlePicker;
    NSArray *pickerData;
    
    UIImageView *box;
    UILabel *players;
    
    
    
}
@property(nonatomic , retain) UIPickerView *singlePicker;
@property(nonatomic , retain) NSArray *pickerData;
@property (nonatomic) NSInteger gameState;
@property (nonatomic) NSInteger previousState;

@property (nonatomic, retain) IBOutlet UIImageView *box;
@property (nonatomic, retain) IBOutlet UILabel *players;


-(IBAction)buttonPressed1;

@end

