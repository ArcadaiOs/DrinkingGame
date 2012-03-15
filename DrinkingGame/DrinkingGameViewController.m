//
//  DrinkingGameViewController.m
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DrinkingGameViewController.h"
#import <Twitter/Twitter.h>

#import "DGPlayer.h"
#import "DGController.h"

@implementation DrinkingGameViewController
@synthesize controller;
@synthesize twitterButton;
@synthesize delegate, debugView;


//@synthesize tabBarController = _tabBarController;

-(void ) setupDone{
    NSLog(@"SETUP DONE");
}
//-(id)initWithController: (DGController*) controllerIn{
//    self = [super init];
//    if (self) {
// //       [self setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Games" image:[UIImage imageNamed:@"iconGamesA.png"] tag:1]];
////        controller = controllerIn;
////        [[DGController sharedInstance] setDelegate:self];
//        //tabBarController = [[UITabBarController alloc] init];
//        //tabBarController.delegate = self;
//        //DGPlayerStatView* statView = [[DGPlayerStatView alloc] initWithController:controller];
//        //DGGameListView* gameList = [[DGGameListView alloc] initWithController:controller];
//        
//        
//
//       // NSArray* controllers = [NSArray arrayWithObjects:statView, gameList, nil];
//        //tabBarController.viewControllers = controllers;
//        //[self presentModalViewController:tabBarController animated:NO];
//        
//    }
//    return self;
//    
//}

// TwitterShittiii

// -(IBAction)twitterAction:(id)sender{
//        NSString *player1 = [[[controller players]objectAtIndex:0] name];
//    TWTweetComposeViewController *twitt = [[TWTweetComposeViewController alloc] init];
//    [twitt setInitialText:[NSString stringWithFormat:@"%@ was playing #DrinkingGame with @pstrande",player1]];
//    //   [[twitt setInitialText:[NSString stringWithFormat:@"%.2f",[[ DGViewPlayer getPromille] floatValue]]];
// }

-(IBAction)twitterAction:(id)sender{       //TWITTER BEGINS
    
    int amountOfPlayers = [[controller players]count];
//        NSString *player1 = [[[controller players]objectAtIndex:1] name];
  
    NSString *names = @""; 
    NSMutableString *namelist;
    namelist = [NSMutableString stringWithString: names];
    
    for (int i = 0; i < amountOfPlayers; i++) {
        
        [namelist appendString:[[[controller players]objectAtIndex:i]name]];
        
        if(i+1 < amountOfPlayers-1 ){
        [namelist appendString:[NSString stringWithFormat: @", "]];
        }
        
        if(i == amountOfPlayers-2 ){
            [namelist appendString:[NSString stringWithFormat: @" and "]]; //Amazing.
        }

    }
 //   NSLog(@"Moro %@" , namelist);
    
    TWTweetComposeViewController *twitt = [[TWTweetComposeViewController alloc] init];
    [twitt setInitialText:[NSString stringWithFormat:@"%@ played #DrinkingGame and got drunk",namelist]];
/*
  [[twitt setInitialText:[NSString stringWithFormat:@"%i players played #DrinkingGame with @pstrande",amountOfPlayers]];
  [[twitt setInitialText:[NSString stringWithFormat:@"%.2f",[[ DGViewPlayer getPromille] floatValue]]];

for (int i = 0; i < amountOfPlayers; i++) {
    NSLog(@"hej spelare, %@", [[[controller players]objectAtIndex:i]name]); 
}    
    NSLog(@"Hej på dig, %@", names);
*/
    [self presentModalViewController:twitt animated:YES];
}

// end Twitter


//-(DGController *) controller{
//    return [DGController sharedInstance];
//}

-(void) launchGameView:(DGGame*)game{
    if (currentGame != nil) {
        [currentGame.view removeFromSuperview];
//        [currentGame release];
    }
    
    [debugView removeFromSuperview];
    currentGame = game;
    //[self dismissModalViewControllerAnimated:NO];
    NSLog(@"current game: %@", currentGame.name);
    [self.view addSubview:currentGame.view];
    [currentGame startGame];

}

-(IBAction)launchRandomShot:(id)sender{
    //[self launchGame:[[DGRandomShot alloc] init]];
    [self launchGameView:[[[DGController sharedInstance] games] objectForKey:@"Random Shot"]];
    
}
-(IBAction)launchSteadyHands:(id)sender{
    //[self launchGame:[[DGSteadyHands alloc] init]];
    [self launchGameView:[[[DGController sharedInstance] games] objectForKey:@"Steady Hands"]];
    
}
-(IBAction) launchWhackAMole:(id)sender{
    [self launchGameView:[[[DGController sharedInstance] games] objectForKey:@"Whack A Mole"]];
}
-(IBAction) launchFillTheBottle:(id)sender{
    [self launchGameView:[[[DGController sharedInstance] games] objectForKey:@"Fill the Bottle"]];
    
}
-(IBAction) launchMenu:(id)sender{
    if (currentGame != nil) {
        [currentGame.view removeFromSuperview];
        [currentGame release];
    }    
    //    currentCame = [[DGStartMenu alloc] init];
    //    [self.view addSubview:currentCame.view];
    //    UIView * v = [[DGStartMenu alloc] init].view;
    DGStartMenu *startMeny = [[DGStartMenu alloc] init];
//    [startMeny setDelegate:self];
    
    [self.view addSubview:startMeny.view];

}

-(IBAction)launchSimon:(id)sender{
    [self launchGameView:[[[DGController sharedInstance] games] objectForKey:@"Simon Says"]];
    
}

-(void) showPlayer:(DGPlayer *)player{
    NSLog(@"GDViewController ShowPlayer");
    
    [currentGame.view removeFromSuperview];
    [playerImgFrame removeFromSuperview];
    playerImgFrame.center = CGPointMake(150, 195);
    
    [nextPlayerView removeFromSuperview];
    [nextPlayerView addSubview:playerImgFrame];
    [nextPlayerView setCenter:CGPointMake(160, 210)];

    [viewControl.view addSubview:nextPlayerView];
    
    [self.view addSubview:nextPlayerView];
    
//    [viewControl presentModalViewController:viewControl animated:NO];
//    [self presentModalViewController:viewControl animated:NO];
    
    playerImg.image = player.image;
    playerNameLabel.text = player.name;
}


-(IBAction)playerReadyToPlay:(id)sender{
    NSLog(@"player ready viewvontroller");
    [nextPlayerView removeFromSuperview];
//    [viewControl dismissModalViewControllerAnimated:NO];
    //[viewControl.view addSubview:currentGame.view];
    
    [self.view addSubview:currentGame.view];
    //[viewControl presentModalViewController:viewControl animated:NO];
    [currentGame playerReady];
    //[delegate playerReady];
}

-(IBAction)showPlayerStats:(id)sender{
    if (currentGame != nil) {
        [currentGame.view removeFromSuperview];
    }
    [debugView removeFromSuperview];
    NSLog(@"Game Stat View");
    DGPlayerStatView* stat = [[DGPlayerStatView alloc] init];
    [self.view addSubview:stat.view];
    [self presentModalViewController:stat animated:NO];
}

-(void) gameEndedWithPlayer:(DGPlayer *)player{
    NSLog(@"Game %@ ended with loser %@", currentGame.name, player.name);
    DGController* gameController = [DGController sharedInstance];
    if (gameController.fullAuto) {
        [player takeShot:[gameController.drinks valueForKey:@"Shot"]];
    } else {
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
}

-(IBAction)launchLOOSER:(id)sender{
    [self gameEndedWithPlayer:[[[DGController sharedInstance] players] objectAtIndex:0]];
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
    [loosingPlayer takeShot:[[[DGController sharedInstance] drinks] valueForKey:chosenPunnishment]];
    
    [self.view addSubview:debugView ];    
}

-(IBAction) stopMusic:(id)sender{
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    NSLog(@"%@",sender);
}

-(IBAction)fullAuto:(id)sender{
    DGController * gameController = [DGController sharedInstance];
    gameController.fullAuto = YES;
//    [gameController autoFillPlayers];
    [gameController startCompetition];
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
    NSLog(@"START");
    [super viewDidLoad];
    //controller = [[DGController alloc] init] ;
    //[[DGController sharedInstance] setDelegate:self];
    //[ctrl fetchRecords];
    
//    viewControl = [[UIViewController alloc] init];
//    [viewControl setView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"DGmenubg.png"]]];
    
    UIFont *rockwell = [UIFont fontWithName:@"Rockwell Extra Bold" size:35];
    [playerNameLabel setFont:rockwell];
    
    UIColor *red = [UIColor colorWithRed:0.8 green:0.1 blue:0.1 alpha:1.0];
    UIColor *transparent = [UIColor colorWithWhite:0.0 alpha:0.0];
    UILabel *loserIs = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 300, 40)];
    [loserIs setText:@"The Loser IS"];
    loserIs.textColor = red;
    loserIs.backgroundColor = transparent;
    loserIs.font = rockwell;
    [playerLostView addSubview:loserIs];
    DGController * gameController = [DGController sharedInstance];
    if (gameController.debugging) {
        [self.view addSubview:debugView ];
    }else if (gameController.fullAuto) {
        [gameController startCompetition]; 
    } else {
        [self launchMenu:nil];
    }
    
//    [self.view addSubview:debugView ];
    
    //[self launchGame:[[DGGameSimonSays alloc] initWithController:[DGController sharedInstance]]];
    //[self launchGame:[self.controller.games objectAtIndex:0]];
  //  [currentGame StartGame];

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
