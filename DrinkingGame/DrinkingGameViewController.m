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

-(IBAction)twitterAction:(id)sender{
        NSString *player1 = [[[controller players]objectAtIndex:0] name];
    TWTweetComposeViewController *twitt = [[TWTweetComposeViewController alloc] init];
    [twitt setInitialText:[NSString stringWithFormat:@"%@ was playing #DrinkingGame with @pstrande",player1]];
 //   [[twitt setInitialText:[NSString stringWithFormat:@"%.2f",[[ DGViewPlayer getPromille] floatValue]]];

    //HÄR ÄR VÅR TWITTERJUTTU


    
    
    NSLog(@"Hej på dig, %@", player1);
    
    [self presentModalViewController:twitt animated:YES];
}

-(DGController *) controller{
    return [DGController sharedInstance];
}

-(IBAction)launchTestGame:(id)sender{
    [currentCame.view removeFromSuperview];
    [currentCame release];
    currentCame = [[DGRandomShot alloc] initWithController:controller];
    [self.view addSubview:currentCame.view];
}
-(IBAction)launchSteadyHands:(id)sender{
    [currentCame.view removeFromSuperview];
    [currentCame release];
    currentCame = [[DGSteadyHands alloc] initWithController:controller];
    [self.view addSubview:currentCame.view];
}
-(IBAction) launchWhackAMole:(id)sender{
    [currentCame.view removeFromSuperview];
    [currentCame release];
    currentCame = [[DGTestGameTwo alloc] initWithController:controller];
    [self.view addSubview:currentCame.view];
}
-(IBAction) launchFillTheBottle:(id)sender{
    [currentCame.view removeFromSuperview];
    [currentCame release];
    currentCame = [[DGFillTheBottle alloc] initWithController:controller];
    [self.view addSubview:currentCame.view];
}
-(IBAction) launchMenu:(id)sender{
    [currentCame.view removeFromSuperview];
    [currentCame release];
//    currentCame = [[DGStartMenu alloc] init];
//    [self.view addSubview:currentCame.view];
//    UIView * v = [[DGStartMenu alloc] init].view;
    [self.view addSubview:[[DGStartMenu alloc] init].view];
}
-(IBAction)launchSimon:(id)sender{
    [currentCame.view removeFromSuperview];
    [currentCame release];
    
    currentCame = [[DGGameSimonSays alloc] initWithController:controller];
    [self.view addSubview:currentCame.view];
}
-(IBAction) showPlayer:(id)sender{

}
-(void) gameEndedWithScores:(NSString*) scores{
    NSLog(@"Game ended: %@", scores);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data,pl images, etc that aren't in use.
}

#pragma mark - View lifecycle

//test1//

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    controller = [[DGController alloc] init];
    //[ctrl fetchRecords];
    
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
