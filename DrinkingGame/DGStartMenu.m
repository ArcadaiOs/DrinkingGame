//
//  DrinkingGameViewController.m
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGStartMenu.h"




@implementation DGStartMenu


//@synthesize  ae;
//@synthesize view;
//@synthesize gameState, previousState;
//menu 1
@synthesize players, background1, menuNumbers, pointBackActive1, pointNextActive1, pointBackActive2, pointNextActive2, pointNextActive3, pointBackActive3, pointBack, pointNext;
@synthesize selected2, selected3, selected4, selected5, selected6, selected7, selected8;
@synthesize btnContinue, btnBack, btnContinue2, btnBack2, btnContinue3, btnBack3;
@synthesize btn2, btn3, btn4, btn5, btn6, btn7, btn8;
//menu 2
@synthesize menu2;
@synthesize menu3CrossMale, menu3CrossFemale, menu3male, menu3female;
@synthesize bottleEasySelected, bottleMediumSelected, bottleHardSelected, bottleCustomSelected;
@synthesize buttonEasy, buttonHard, buttonCustom, buttonMedium;
//menu 3
@synthesize weight, name, gender, polaroid, getNewPlayer;


@synthesize numberPadDoneImageNormal;
@synthesize numberPadDoneImageHighlighted;
@synthesize numberPadDoneButton;

//-(DGStartMenu*)init{
//    [super init];
//    
//}



- (void)viewDidLoad
{
    [super viewDidLoad];    
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"song.mp3"];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
//    self.ae = [[SimpleAudioEngine alloc] init];
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    
}

- (void)dealloc
{
 
    [numberPadDoneImageNormal release];
    [numberPadDoneImageHighlighted release];
    [numberPadDoneButton release];
    
    [super dealloc];
}


-(IBAction)startGame:(id)sender{
    [self.view removeFromSuperview];
    [[DGController sharedInstance] startRandomGame];
}

-(IBAction)buttonClickedContinue {
//    firstView = self.view;
    [[SimpleAudioEngine sharedEngine] playEffect:@"boo.mp3"];
    
    if (self.view == secondView) {
        self.view = thirdView;
    } else if (self.view == thirdView) {
        if (amountOfPlayers <= 0) {
            [self startGame:nil];
        } 
//        else {
//            self.view = thirdView;
//        }
    } else {
        firstView = self.view;
        self.view = secondView;
    }
}



-(UIImage*) getImage{
//    return [UIImage imageNamed:@"Soini.jpeg"];
   return self.polaroid.image;
}

-(IBAction)takePicture:(id)sender{
    NSLog(@"TakePictureButton Pressed");
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.delegate = self;
        picker.allowsEditing = YES;
        [self presentModalViewController: picker animated:YES];
    }
}

-(void) imagePickerController: (UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{    
    self.polaroid.image = [UIImage imageWithData:UIImagePNGRepresentation([info objectForKey:UIImagePickerControllerEditedImage])];
    [picker dismissModalViewControllerAnimated:YES];
    [picker release];
    [self closekeyboard];
}

-(void) imagePickerControllerDidCancel: (UIImagePickerController *)picker {
    [picker dismissModalViewControllerAnimated:YES];
    [picker release];
}

-(IBAction)buttonGetNewPlayer {
    // check if image is set (self.polariod.image) and there are still players to register
  //  if (self.polaroid.image != nil && amountOfPlayers > 0) {
        NSLog(@"getNewPlayer %i", amountOfPlayers);
        // save new player
        [[DGController sharedInstance] addPlayerWithimage:self.polaroid.image 
                                                     name:self.name.text 
                                                   weight:[self.weight.text integerValue]  
                                                 isFemale:self.gender];
        // minska amountOfPlayers by one 
        amountOfPlayers--;
        
        // clear view
        self.polaroid.image = nil;
        self.weight.text = [NSString stringWithString:@"***"];
        self.name.text = [NSString stringWithString:@"NAME"];
        menu3CrossFemale.hidden = 1;
        menu3CrossMale.hidden = 1;
        self.gender = NO;
        btnContinue3.hidden = 1;
        pointNextActive3.hidden = 1;
 //   }
    if (amountOfPlayers <= 0) {
        // go and play
        [self startGame:nil];
    }   
}




-(IBAction)buttonClickedBack {
    amountOfPlayers = originalAmountOfPlayers;
        [[SimpleAudioEngine sharedEngine] playEffect:@"boo.mp3"];
    
    if (self.view == secondView) {
        self.view = firstView;
    } else if (self.view == thirdView) {
        self.view = secondView;
    } else if (self.view == firstView) {
        [self.view removeFromSuperview];
    }   
}

//Meny 1

-(IBAction)buttonPlayers2 {
    amountOfPlayers = 2;
    originalAmountOfPlayers = 2;
    btnContinue.hidden = 0;
    pointNextActive1.hidden = 0;
    selected2.hidden = 0;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
    
}
-(IBAction)buttonPlayers3 {
    amountOfPlayers = 3;
    originalAmountOfPlayers = 3;
    btnContinue.hidden = 0;
    pointNextActive1.hidden = 0;
    selected2.hidden = 1;
    selected3.hidden = 0;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers4 {
    amountOfPlayers = 4;
    originalAmountOfPlayers = 4;
    btnContinue.hidden = 0;
    pointNextActive1.hidden = 0;
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 0;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers5 {
    amountOfPlayers = 5;
    originalAmountOfPlayers = 5;
    btnContinue.hidden = 0;
    pointNextActive1.hidden = 0;
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 0;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers6 {
    amountOfPlayers = 6;
    originalAmountOfPlayers = 6;
    btnContinue.hidden = 0;
    pointNextActive1.hidden = 0;
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 0;
    selected7.hidden = 1;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers7 {
    amountOfPlayers = 7;
    originalAmountOfPlayers = 7;
    btnContinue.hidden = 0;
    pointNextActive1.hidden = 0;
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 0;
    selected8.hidden = 1;
    
}
-(IBAction)buttonPlayers8 {
    amountOfPlayers = 8;
    originalAmountOfPlayers = 8;
    btnContinue.hidden = 0;
    pointNextActive1.hidden = 0;
    selected2.hidden = 1;
    selected3.hidden = 1;
    selected4.hidden = 1;
    selected5.hidden = 1;
    selected6.hidden = 1;
    selected7.hidden = 1;
    selected8.hidden = 0;
    
}

//Meny 2


-(IBAction)buttonEasyPressed {
    ((DGController*)[DGController sharedInstance]).gameLevel = 0;
    pointNextActive2.hidden = 0;
    btnContinue2.hidden = 0;
    bottleEasySelected.hidden = 0;
    bottleMediumSelected.hidden = 1;
    bottleHardSelected.hidden = 1;
    bottleCustomSelected.hidden = 1;
}

-(IBAction)buttonMediumPressed {
    ((DGController*)[DGController sharedInstance]).gameLevel = 1;
    pointNextActive2.hidden = 0;
    btnContinue2.hidden = 0;
    bottleEasySelected.hidden = 1;
    bottleMediumSelected.hidden = 0;
    bottleHardSelected.hidden = 1;
    bottleCustomSelected.hidden = 1;
}

-(IBAction)buttonHardPressed {
    ((DGController*)[DGController sharedInstance]).gameLevel = 2;
    pointNextActive2.hidden = 0;
    bottleEasySelected.hidden = 1;
    btnContinue2.hidden = 0;
    bottleMediumSelected.hidden = 1;
    bottleHardSelected.hidden = 0;
    bottleCustomSelected.hidden = 1;
}

-(IBAction)buttonCustomPressed {
    ((DGController*)[DGController sharedInstance]).gameLevel = 3;
    pointNextActive2.hidden = 0;
    bottleEasySelected.hidden = 1;
    btnContinue2.hidden = 0;
    bottleMediumSelected.hidden = 1;
    bottleHardSelected.hidden = 1;
    bottleCustomSelected.hidden = 0;
}

//Meny 3

-(IBAction)menu3malePressed {
    menu3CrossMale.hidden = 0;
    menu3CrossFemale.hidden = 1;
    self.gender = NO;
    [self closekeyboard];
}

-(IBAction)menu3femalePressed {
    menu3CrossMale.hidden = 1;
    menu3CrossFemale.hidden = 0;
    self.gender = YES;
    [self closekeyboard];
}


// DONE BUTTON FOR WEIGHT TEXT FIELD
// DONE BUTTON FOR WEIGHT TEXT FIELD
// DONE BUTTON FOR WEIGHT TEXT FIELD
// DONE BUTTON FOR WEIGHT TEXT FIELD
// DONE BUTTON FOR WEIGHT TEXT FIELD
// DONE BUTTON FOR WEIGHT TEXT FIELD
// DONE BUTTON FOR WEIGHT TEXT FIELD
// DONE BUTTON FOR WEIGHT TEXT FIELD

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle {
    if ([super initWithNibName:nibName bundle:nibBundle] == nil)
        return nil;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.0) {
        self.numberPadDoneImageNormal = [UIImage imageNamed:@"doneup.png"];
        self.numberPadDoneImageHighlighted = [UIImage imageNamed:@"donedown.png"];
    } else {        
        self.numberPadDoneImageNormal = [UIImage imageNamed:@"doneup.png"];
        self.numberPadDoneImageHighlighted = [UIImage imageNamed:@"donedown.png"];
    }        
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Add listener for keyboard display events
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(keyboardDidShow:) 
                                                     name:UIKeyboardDidShowNotification 
                                                   object:nil];     
    } else {
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(keyboardWillShow:) 
                                                     name:UIKeyboardWillShowNotification 
                                                   object:nil];
    }
    
    // Add listener for all text fields starting to be edited
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(textFieldDidBeginEditing:)
                                                 name:UITextFieldTextDidBeginEditingNotification 
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
        [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                        name:UIKeyboardDidShowNotification 
                                                      object:nil];      
    } else {
        [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                        name:UIKeyboardWillShowNotification 
                                                      object:nil];
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:UITextFieldTextDidBeginEditingNotification 
                                                  object:nil];
    [super viewWillDisappear:animated];
}

- (UIView *)findFirstResponderUnder:(UIView *)root {
    if (root.isFirstResponder)
        return root;    
    for (UIView *subView in root.subviews) {
        UIView *firstResponder = [self findFirstResponderUnder:subView];        
        if (firstResponder != nil)
            return firstResponder;
    }
    return nil;
}

- (UITextField *)findFirstResponderTextField {
    UIResponder *firstResponder = [self findFirstResponderUnder:[self.view window]];
    if (![firstResponder isKindOfClass:[UITextField class]])
        return nil;
    return (UITextField *)firstResponder;
}

- (void)updateKeyboardButtonFor:(UITextField *)weight {
    
    // Remove any previous button
    [self.numberPadDoneButton removeFromSuperview];
    self.numberPadDoneButton = nil;
    
    // Does the text field use a number pad?
    if (weight.keyboardType != UIKeyboardTypeNumberPad)
        return;
    
    // If there's no keyboard yet, don't do anything
    if ([[[UIApplication sharedApplication] windows] count] < 2)
        return;
    UIWindow *keyboardWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    
    // Create new custom button
    self.numberPadDoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.numberPadDoneButton.frame = CGRectMake(0, 163, 106, 53);
    self.numberPadDoneButton.adjustsImageWhenHighlighted = FALSE;
    [self.numberPadDoneButton setImage:self.numberPadDoneImageNormal forState:UIControlStateNormal];
    [self.numberPadDoneButton setImage:self.numberPadDoneImageHighlighted forState:UIControlStateHighlighted];
    [self.numberPadDoneButton addTarget:self action:@selector(numberPadDoneButton:) forControlEvents:UIControlEventTouchUpInside];
    
    // Locate keyboard view and add button
    NSString *keyboardPrefix = [[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2 ? @"<UIPeripheralHost" : @"<UIKeyboard";
    for (UIView *subView in keyboardWindow.subviews) {
        if ([[subView description] hasPrefix:keyboardPrefix]) {
            [subView addSubview:self.numberPadDoneButton];
            [self.numberPadDoneButton addTarget:self action:@selector(numberPadDoneButton:) forControlEvents:UIControlEventTouchUpInside];
            break;
        }
    }
}

- (void)textFieldDidBeginEditing:(NSNotification *)note {
    [self updateKeyboardButtonFor:[note object]];
}



- (void)keyboardWillShow:(NSNotification *)note {
    [self updateKeyboardButtonFor:[self findFirstResponderTextField]];
}

- (void)keyboardDidShow:(NSNotification *)note {
    [self updateKeyboardButtonFor:[self findFirstResponderTextField]];
}

- (IBAction)numberPadDoneButton:(id)sender {
    UITextField *weight = [self findFirstResponderTextField];
        thirdView.superview.frame = CGRectMake(0,20,320,480);
    
            btnBack3.hidden = 0;
    if  // (self.polaroid.image != nil
        // && 
        (![name.text isEqualToString:@"NAME"]
         && 
         (![weight.text isEqualToString:@"***"]) 
         && 
         ((menu3CrossMale.hidden == 0) || (menu3CrossFemale.hidden == 0))) {
            NSLog(@"Player completed...");
            
            
            
            
            
            
            
            if (amountOfPlayers == 0) {
                
                getNewPlayer.hidden = 1;
                btnContinue3.hidden = 0;
                pointNextActive3.hidden = 0;
            }
            
            
            else {
                
                getNewPlayer.hidden = 0;
                pointNextActive3.hidden = 0;
            }
            
        }
    
    else {
        
        getNewPlayer.hidden = 1;
        btnContinue3.hidden = 1;
        pointNextActive3.hidden = 1;
    }
    

    [weight resignFirstResponder];
}

//DONE BUTTON FOR WEIGHT FIELD END
//DONE BUTTON FOR WEIGHT FIELD END
//DONE BUTTON FOR WEIGHT FIELD END
//DONE BUTTON FOR WEIGHT FIELD END
//DONE BUTTON FOR WEIGHT FIELD END
//DONE BUTTON FOR WEIGHT FIELD END
//DONE BUTTON FOR WEIGHT FIELD END







-(IBAction)openkeyboard {
    thirdView.superview.frame = CGRectMake(0,-195,320,480);
    btnBack3.hidden = 1;
}

-(IBAction)closekeyboard {
    thirdView.superview.frame = CGRectMake(0,20,320,480);
    [self.view endEditing:TRUE];
        btnBack3.hidden = 0;
    
    if  // (self.polaroid.image != nil
         // && 
         (![name.text isEqualToString:@"NAME"]
         && 
         (![weight.text isEqualToString:@"***"]) 
         && 
         ((menu3CrossMale.hidden == 0) || (menu3CrossFemale.hidden == 0))) {
        NSLog(@"Player completed...");
        

    

    
    
    
    if (amountOfPlayers == 0) {
        
        getNewPlayer.hidden = 1;
        btnContinue3.hidden = 0;
        pointNextActive3.hidden = 0;
    }

    
    else {
    
        getNewPlayer.hidden = 0;
        pointNextActive3.hidden = 0;
    }

         }
    
    else {
        
        getNewPlayer.hidden = 1;
        btnContinue3.hidden = 1;
        pointNextActive3.hidden = 1;
    }
    
}




@end