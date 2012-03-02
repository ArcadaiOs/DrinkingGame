//
//  DrinkingGameViewController.m
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DrinkingGameViewController.h"
//#import <Twitter/Twitter.h>

#import "DGPlayer.h"
#import "DGController.h"

@implementation DrinkingGameViewController
@synthesize controller;
//@synthesize twitterButton;
@synthesize delegate;
-(id)init{
    self = [super init];
    if (self) {
        [controller setDelegate:self];

    }
    return self;
    
}
// TwitterShittiii
/*
 -(IBAction)twitterAction:(id)sender{
        NSString *player1 = [[[controller players]objectAtIndex:0] name];
    TWTweetComposeViewController *twitt = [[TWTweetComposeViewController alloc] init];
    [twitt setInitialText:[NSString stringWithFormat:@"%@ was playing #DrinkingGame with @pstrande",player1]];
    //   [[twitt setInitialText:[NSString stringWithFormat:@"%.2f",[[ DGViewPlayer getPromille] floatValue]]];

    //HÄR ÄR VÅR TWITTERJUTTU
    NSLog(@"Hej på dig, %@", player1);
    
    [self presentModalViewController:twitt animated:YES];
}
*/
// end Twitter


-(DGController *) controller{
    return [DGController sharedInstance];
}
-(IBAction) testDrink:(id)sender{
    [[controller.players objectAtIndex:0] takeShot:[controller.drinks objectForKey:@"TEST"]];
    
}
-(void) launchGame:(DGGame*)game{
    [currentGame.view removeFromSuperview];
    [currentGame release];
    [debugView removeFromSuperview];
    
    currentGame = game;
    [self.view addSubview:currentGame.view];
    
}
-(IBAction)launchRandomShot:(id)sender{
    [self launchGame:[[DGRandomShot alloc] initWithController:controller]];
    
}
-(IBAction)launchSteadyHands:(id)sender{
    [self launchGame:[[DGSteadyHands alloc] initWithController:controller]];
    
}
-(IBAction) launchWhackAMole:(id)sender{
    [self launchGame:[[DGTestGameTwo alloc] initWithController:controller]];
}
-(IBAction) launchFillTheBottle:(id)sender{
    [self launchGame:[[DGFillTheBottle alloc] initWithController:controller]];
}
-(IBAction) launchMenu:(id)sender{
    [currentGame.view removeFromSuperview];
    [currentGame release];
    //    currentCame = [[DGStartMenu alloc] init];
    //    [self.view addSubview:currentCame.view];
    //    UIView * v = [[DGStartMenu alloc] init].view;
    //    [self.view addSubview:[[DGStartMenu alloc] init].view];
}
-(IBAction)launchSimon:(id)sender{
    [self launchGame:[[DGGameSimonSays alloc] initWithController:controller]];
}


-(void) showPlayer:(DGPlayer *)player{
    [playerImgFrame removeFromSuperview];
    playerImgFrame.center = CGPointMake(150, 195);
    
    [nextPlayerView addSubview:playerImgFrame];
    [nextPlayerView setCenter:CGPointMake(160, 210)];
    [viewControl.view addSubview:nextPlayerView];
    
    [self presentModalViewController:viewControl animated:NO];
    
    playerImg.image = player.image;
    playerNameLabel.text = player.name;
}


-(IBAction)playerReadyToPlay:(id)sender{
    NSLog(@"player ready viewvontroller");
    [nextPlayerView removeFromSuperview];
    [viewControl dismissModalViewControllerAnimated:YES];
    [currentGame playerReady];
    //[delegate playerReady];
}
-(void) gameEndedWithLooser:(DGPlayer *)player{
    loosingPlayer = player;
    //NSLog(@"gamendeViewController");
    [debugView removeFromSuperview];
    playerImg.image = player.image;
    playerNameLabel.text = player.name;
    [currentGame.view removeFromSuperview];
    [playerImgFrame removeFromSuperview];
    playerImgFrame.center = CGPointMake(160, 215);
    [boozeChooserView addSubview:playerImgFrame];
    
    [viewControl.view addSubview:boozeChooserView];
    
    [self presentModalViewController:viewControl animated:NO];
    [[playerImgFrame superview] sendSubviewToBack:playerImgFrame];
}

-(IBAction)launchLOOSER:(id)sender{
    [self gameEndedWithLooser:[controller.players objectAtIndex:0]];
}

-(IBAction)showPunnishmentChooser:(id)sender{
    [self dismissModalViewControllerAnimated:NO];
    
    [playerLostView removeFromSuperview];
    [viewControl.view addSubview:boozeChooserView];
    
    [self presentModalViewController:viewControl animated:NO];
    
}
-(IBAction)punnishmentChosen:(id) sender{
    [boozeChooserView removeFromSuperview];
    [viewControl dismissModalViewControllerAnimated:YES];
    [playerImgFrame removeFromSuperview];
    

    
    NSString *chosenPunnishment = (NSString*) ((UIButton*)sender).titleLabel.text;
    [loosingPlayer takeShot:[controller.drinks valueForKey:chosenPunnishment]];
    
    [self.view addSubview:debugView ];    
}

-(IBAction) stopMusic:(id)sender{
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    NSLog(@"%@",sender);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data,pl images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    controller = [[DGController alloc] init] ;
    [controller setDelegate:self];
    //[ctrl fetchRecords];
    viewControl = [[UIViewController alloc] init];
    [viewControl setView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"DGmenubg.png"]]];

    
    UIFont *rockwell = [UIFont fontWithName:@"Rockwell Extra Bold" size:35];
    [playerNameLabel setFont:rockwell];
    
    UIColor *red = [UIColor colorWithRed:0.8 green:0.1 blue:0.1 alpha:1.0];
    UIColor *transparent = [UIColor colorWithWhite:0.0 alpha:0.0];
    UILabel *looserIs = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 300, 40)];
    [looserIs setText:@"The Looser IS"];
    looserIs.textColor = red;
    looserIs.backgroundColor = transparent;
    looserIs.font = rockwell;
    
    
    [playerLostView addSubview:looserIs];
    
    [self.view addSubview:debugView ];
    
    NSLog(@"drinakr: %i", controller.drinks.count);
    
    [[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"song.mp3"];
    
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
