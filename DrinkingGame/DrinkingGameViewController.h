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
    IBOutlet UIPickerView *singlePicker;
    NSArray *pickerData;
}
@property(nonatomic , retain) UIPickerView *singlePicker;
@property(nonatomic , retain) NSArray *pickerData;
-(IBAction)buttonPressed1;

@end

