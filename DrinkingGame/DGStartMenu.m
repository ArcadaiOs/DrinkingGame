//
//  DrinkingGameViewController.m
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGStartMenu.h"


#define twoPlayers 2



@implementation DGStartMenu


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
@synthesize weight, name, gender, polaroid;





- (void)viewDidLoad
{
    
    
    
    
    
    [super viewDidLoad];
    
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
    
}

- (void)dealloc
{
    
    [super dealloc];
}


-(IBAction)startGame:(id)sender{
    [[DGController sharedInstance] startRandomGame];
}

-(IBAction)buttonClickedContinue {
    firstView = self.view;
    
    
    if (self.view == secondView) {
        
        self.view = thirdView;
    }
    else {
        if (amountOfPlayers == 0) {
            [self startGame:nil];
        } else {
            self.view = thirdView;
        }
        return;
        
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
}

-(void) imagePickerControllerDidCancel: (UIImagePickerController *)picker {
    [picker dismissModalViewControllerAnimated:YES];
    [picker release];
}

-(IBAction)buttonGetNewPlayer {
    
    // save new player
    int w = 0; // number from self.weight
    BOOL genderOfPlayer = NO; // BOOL from self.gender
    // should check if image is set : self.polariod.image
    [[DGController sharedInstance] addPlayerWithimage:self.polaroid.image weight:w  isFemale:genderOfPlayer];
    // minska amountOfPlayers by one 
    amountOfPlayers--;
    if (amountOfPlayers == 0) {
        // go and play
        [self startGame:nil];
    } else {
        // clear view
        self.polaroid.image = nil;
        self.weight.text = nil;//@"***";
        menu3CrossFemale.hidden = 1;
        menu3CrossMale.hidden = 1;
        self.gender = NO;
        // rekursiv anrop buttonGetNewPlayer
        [self buttonGetNewPlayer];
    }   
}




-(IBAction)buttonClickedBack {
    
    if (self.view == secondView) {
        
        self.view = firstView;
    }
    if (self.view == thirdView) {
        
        self.view = secondView;
    }
    
    else {
        [self.view removeFromSuperview];
    }   
    
}

//Meny 1

-(IBAction)buttonPlayers2 {
    
    amountOfPlayers = 2;
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
    bottleEasySelected.hidden = 0;
    bottleMediumSelected.hidden = 1;
    bottleHardSelected.hidden = 1;
    bottleCustomSelected.hidden = 1;
    
}

-(IBAction)buttonMediumPressed {
    ((DGController*)[DGController sharedInstance]).gameLevel = 1;
    pointNextActive2.hidden = 0;
    bottleEasySelected.hidden = 1;
    bottleMediumSelected.hidden = 0;
    bottleHardSelected.hidden = 1;
    bottleCustomSelected.hidden = 1;
}

-(IBAction)buttonHardPressed {
    ((DGController*)[DGController sharedInstance]).gameLevel = 2;
    pointNextActive2.hidden = 0;
    bottleEasySelected.hidden = 1;
    bottleMediumSelected.hidden = 1;
    bottleHardSelected.hidden = 0;
    bottleCustomSelected.hidden = 1;
}

-(IBAction)buttonCustomPressed {
    ((DGController*)[DGController sharedInstance]).gameLevel = 3;
    pointNextActive2.hidden = 0;
    bottleEasySelected.hidden = 1;
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


-(IBAction)openkeyboard {
    
    
    thirdView.superview.frame = CGRectMake(0,-200,320,480);
    
    
}

-(IBAction)closekeyboard {
    
    
    
    thirdView.superview.frame = CGRectMake(0,0,320,480);
    [self.view endEditing:TRUE];
    // 
    if  ((![name.text isEqualToString:@"NAME"]) && (![weight.text isEqualToString:@"***"]) && ((menu3CrossMale.hidden == 0) ||
                                                                                               (menu3CrossFemale.hidden == 0))) {
        NSLog(@"lol");
        btnContinue3.hidden = 0;
        pointNextActive3.hidden = 0;
    }
    
}

//        if ((menu3CrossMale.hidden == 0) ||
//            (menu3CrossFemale.hidden == 0)) {




@end