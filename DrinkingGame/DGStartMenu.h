//
//  DrinkingGameViewController.h
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
// test

#import <UIKit/UIKit.h>
#import "DGController.h"
#import "SimpleAudioEngine.h"

@protocol StartMenuProto <NSObject>
-(void) setupDone;
@end

@interface DGStartMenu :  UIViewController 
<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>
{
    id<StartMenuProto> delegate;
    int amountOfPlayers;
    
    NSInteger originalAmountOfPlayers;
    
    

    
    UIImage *numberPadDoneImageNormal;
    UIImage *numberPadDoneImageHighlighted;
    UIButton *numberPadDoneButton;
    

    

    
    //Menu 1
    
    
    UIImageView *players;
    UIImageView *background1;
    UIImageView *menuNumbers;
    
    UIImageView *selected2;
    UIImageView *selected3;
    UIImageView *selected4;
    UIImageView *selected5;
    UIImageView *selected6;
    UIImageView *selected7;
    UIImageView *selected8;
    
    UIImageView *pointNextActive1;
    UIImageView *pointBackActive1;
    
    UIImageView *pointNextActive2;
    UIImageView *pointBackActive2;
    UIImageView *pointNextActive3;
    UIImageView *pointBackActive3;
    
    UIImageView *pointNext;
    UIImageView *pointBack;
    
    UIButton *btnContinue;
    UIButton *btnBack;
    
    UIButton *btn2;
    UIButton *btn3;
    UIButton *btn4;
    UIButton *btn5;
    UIButton *btn6;
    UIButton *btn7;
    UIButton *btn8;
    
    
    //Menu 2
    
    UIImageView *menu2;
    
    UIImageView *bottleEasySelected;
    UIImageView *bottleMediumSelected;
    UIImageView *bottleHardSelected;
    UIImageView *bottleCustomSelected;
    
    
    UIButton *Menu2EasySelected;
    UIButton *Menu2MediumSelected;
    UIButton *Menu2HardSelected;
    UIButton *Menu2CustomSelected;
    
    IBOutlet UIView *originalCenter;
    UIView * view;
    IBOutlet UIView *firstView;
    IBOutlet UIView *secondView;
    IBOutlet UIView *thirdView;
    
    //Menu 3
    
    UIImageView *menu3CrossMale;
    UIImageView *menu3CrossFemale;
    UIButton *menu3male;
    UIButton *menu3female;
    UIButton *getNewPlayer;
    
    UITextField *name;
    UITextField *weight;
    
    IBOutlet UIImageView *polaroid;
    
    BOOL gender;
    
    
}
@property(nonatomic,assign)id delegate;

//@property (nonatomic) NSInteger gameState;
//@property (nonatomic) NSInteger previousState;
//@property (nonatomic, retain) UIView *view;

//Menu 1
//@property (nonatomic, retain) SimpleAudioEngine *ae;
@property (nonatomic, retain) IBOutlet UIButton *btn2;
@property (nonatomic, retain) IBOutlet UIButton *btn3;
@property (nonatomic, retain) IBOutlet UIButton *btn4;
@property (nonatomic, retain) IBOutlet UIButton *btn5;
@property (nonatomic, retain) IBOutlet UIButton *btn6;
@property (nonatomic, retain) IBOutlet UIButton *btn7;
@property (nonatomic, retain) IBOutlet UIButton *btn8;
@property (nonatomic, retain) IBOutlet UIButton *btnContinue;
@property (nonatomic, retain) IBOutlet UIButton *btnBack;
@property (nonatomic, retain) IBOutlet UIButton *btnContinue2;
@property (nonatomic, retain) IBOutlet UIButton *btnBack2;
@property (nonatomic, retain) IBOutlet UIButton *btnContinue3;
@property (nonatomic, retain) IBOutlet UIButton *btnBack3;

@property (nonatomic, retain) IBOutlet UIImageView *players;
@property (nonatomic, retain) IBOutlet UIImageView *background1;
@property (nonatomic, retain) IBOutlet UIImageView *menuNumbers;

@property (nonatomic, retain) IBOutlet UIImageView *pointBackActive1;
@property (nonatomic, retain) IBOutlet UIImageView *pointNextActive1;

@property (nonatomic, retain) IBOutlet UIImageView *pointBackActive2;
@property (nonatomic, retain) IBOutlet UIImageView *pointNextActive2;

@property (nonatomic, retain) IBOutlet UIImageView *pointBackActive3;
@property (nonatomic, retain) IBOutlet UIImageView *pointNextActive3;

@property (nonatomic, retain) IBOutlet UIImageView *pointBack;
@property (nonatomic, retain) IBOutlet UIImageView *pointNext;

@property (nonatomic, retain) IBOutlet UIImageView *selected2;
@property (nonatomic, retain) IBOutlet UIImageView *selected3;
@property (nonatomic, retain) IBOutlet UIImageView *selected4;
@property (nonatomic, retain) IBOutlet UIImageView *selected5;
@property (nonatomic, retain) IBOutlet UIImageView *selected6;
@property (nonatomic, retain) IBOutlet UIImageView *selected7;
@property (nonatomic, retain) IBOutlet UIImageView *selected8;

//Menu 2

@property (nonatomic, retain) IBOutlet UIImageView *menu2;

@property (nonatomic, retain) IBOutlet UIImageView *bottleEasySelected;
@property (nonatomic, retain) IBOutlet UIImageView *bottleMediumSelected;
@property (nonatomic, retain) IBOutlet UIImageView *bottleHardSelected;
@property (nonatomic, retain) IBOutlet UIImageView *bottleCustomSelected;


@property (nonatomic, retain) IBOutlet UIButton *buttonEasy;
@property (nonatomic, retain) IBOutlet UIButton *buttonMedium;
@property (nonatomic, retain) IBOutlet UIButton *buttonHard;
@property (nonatomic, retain) IBOutlet UIButton *buttonCustom;


//Menu 3

@property (nonatomic, retain) IBOutlet UIImageView *menu3CrossFemale;
@property (nonatomic, retain) IBOutlet UIImageView *menu3CrossMale;
@property (nonatomic, retain) IBOutlet UIButton *menu3female;
@property (nonatomic, retain) IBOutlet UIButton *menu3male;
@property (nonatomic, retain) IBOutlet UIButton *getNewPlayer;

@property (nonatomic, retain) IBOutlet UITextField *name;
@property (nonatomic, retain) IBOutlet UITextField *weight;

@property BOOL gender;

@property (nonatomic, retain) UIImageView *polaroid;



@property (nonatomic, retain) UIImage *numberPadDoneImageNormal;
@property (nonatomic, retain) UIImage *numberPadDoneImageHighlighted;
@property (nonatomic, retain) UIButton *numberPadDoneButton;

- (IBAction)numberPadDoneButton:(id)sender;

//-(DGStartMenu*)init;



-(IBAction)buttonClickedContinue;
-(IBAction)buttonClickedBack;

-(IBAction)buttonPlayers2;
-(IBAction)buttonPlayers3;
-(IBAction)buttonPlayers4;
-(IBAction)buttonPlayers5;
-(IBAction)buttonPlayers6;
-(IBAction)buttonPlayers7;
-(IBAction)buttonPlayers8;


-(IBAction)buttonEasyPressed;
-(IBAction)buttonMediumPressed;
-(IBAction)buttonHardPressed;
-(IBAction)buttonCustomPressed;

-(IBAction)menu3femalePressed;
-(IBAction)menu3malePressed;

-(IBAction)closekeyboard;

-(IBAction)openkeyboard;

-(IBAction)buttonGetNewPlayer;

-(IBAction)takePicture:(id)sender;
@end

