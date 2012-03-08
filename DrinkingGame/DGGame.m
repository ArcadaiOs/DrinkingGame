//
//  DGGame.m
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGGame.h"

@implementation DGGame
@synthesize controller;
@synthesize delegate;
@synthesize name;

- (id)initWithController: (DGController*) controllerIn
{
    self = [super init];
    if (self) {
        self.controller = controllerIn;
        // Custom initialization
        [self setDelegate:controller];
      
        
        // Set this to True if one player should only play once
        OnePlayerOnce = false;
    }
    return self;
}

// implement this function in your game for returning the scores
-(void) GameEndedCalculateScores{
    
}

// You should implement this function to start your game, and reset
-(void) StartGame{
    
    
}
// this will show a player with his promille and imgae
// playerReady will execute when player presses Lets Play
-(void) showPlayer:(DGPlayer *)player{
    
    //    [delegate GameEndedWithLooser:player];
    //playerView.view.alpha = 0.0;
    //[self presentModalViewController:playerView animated:NO];
    //[UIView animateWithDuration:1.0
    //                animations:^{playerView.view.alpha = 1.0;}];
    
    
    [controller showPlayer:player];
    //[playerView setPlayer:player];
    
}
-(void) NextPlayer{
    CurrentPlayer = [controller NextPlayerRepeatPlayers:OnePlayerOnce];
    if(CurrentPlayer == nil){
        // All Player has played once
        [self GameEndedCalculateScores];
            
    } else {
        [controller showPlayer:CurrentPlayer];
    }
}

-(void) playerReady{
    NSLog(@"PLAYER READU");
    
}

-(void) gameEndWithLooser:(DGPlayer*) lostPlayer{
    NSLog(@"GameEdned DGGame;");
    [delegate GameEndedWithLooser:lostPlayer];
    [self endGame:nil];
}

-(IBAction)endGame:(id)sender {
    [delegate GameEndedWithLooser:nil];
    //[self endGame:nil];
    // killmiself
    //[self.view removeFromSuperview];
    //[self release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
