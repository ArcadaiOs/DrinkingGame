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

-(IBAction)twitterAction:(id)sender{
    /*    NSString *player1 = [[[controller players]objectAtIndex:0] name];
    TWTweetComposeViewController *twitt = [[TWTweetComposeViewController alloc] init];
    [twitt setInitialText:[NSString stringWithFormat:@"%@ was playing #DrinkingGame with @pstrande",player1]];
 //   [[twitt setInitialText:[NSString stringWithFormat:@"%.2f",[[ DGViewPlayer getPromille] floatValue]]];

    //HÄR ÄR VÅR TWITTERJUTTU


    
    
    NSLog(@"Hej på dig, %@", player1);
    
    [self presentModalViewController:twitt animated:YES];*/
}
*/
-(DGController *) controller{
    return [DGController sharedInstance];
}

-(void) playerReadyToPlay{
    
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
//    [self.view addSubview:[[DGStartMenu alloc] init].view];
}
-(IBAction)launchSimon:(id)sender{
    [currentCame.view removeFromSuperview];
    [currentCame release];
    
    currentCame = [[DGGameSimonSays alloc] initWithController:controller];
    [self.view addSubview:currentCame.view];
}
-(IBAction)showNext:(id)sender{
    [self showPlayer:[controller.players objectAtIndex:0]];
}
-(void) showPlayer:(DGPlayer *)player{
    [playerImgFrame removeFromSuperview];
    [nextPlayerView addSubview:playerImgFrame];
    
    playerImgFrame.center = CGPointMake(150, 195);
    //playerImgFrame.frame=CGRectMake(10, 50, 250, 300);
    [viewControl.view addSubview:nextPlayerView];
    [nextPlayerView setCenter:CGPointMake(160, 210)];
    [self presentModalViewController:viewControl animated:NO];
    playerImg.image = player.image;
}
-(IBAction)playerReadyToPlay:(id)sender{
    NSLog(@"player ready viewvontroller");
    [nextPlayerView removeFromSuperview];
    [viewControl dismissModalViewControllerAnimated:YES];
    [currentCame playerReady];
    //[delegate playerReady];
}
-(IBAction)showPunnishmentChooser:(id)sender{
    [playerImgFrame removeFromSuperview];
    playerImgFrame.center = CGPointMake(130, 195);
    [boozeChooserView addSubview:playerImgFrame];
    [[playerImgFrame superview] sendSubviewToBack:playerImgFrame];

    [viewControl.view addSubview:boozeChooserView];
    [self presentModalViewController:viewControl animated:NO];
    
}
-(IBAction)punnishmentChosen:(id) sender{
    [boozeChooserView removeFromSuperview];
    [viewControl dismissModalViewControllerAnimated:YES];
    
    UIButton *s = (UIButton*)sender;
    
    NSLog(@"%@",s.titleLabel.text);
    
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


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    controller = [[DGController alloc] init];
    [controller setDelegate:self];
    //[ctrl fetchRecords];
    viewControl = [[UIViewController alloc] init];
    [viewControl setView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"DGmenubg.png"]]];
//    [nextPlayerView addSubview:playerImgFrame];

    //[boozeChooserView addSubview:playerImgFrame];    
//    [boo addSubview:playerImgFrame];
    UILabel *ch = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 320, 50)];
    UILabel *bo = [[UILabel alloc] initWithFrame:CGRectMake(0, 85, 320, 50)];
    [ch setTextAlignment:UITextAlignmentCenter];
    [bo setTextAlignment:UITextAlignmentCenter];
    [ch setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:35]];
    [bo setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:40]];
    [ch setTransform:CGAffineTransformMakeRotation(-0.1)];
    [bo setTransform:CGAffineTransformMakeRotation(0.258658)];
    ch.text = @"Choose Your";
    bo.text = @"BOOOZZE";
    UIColor *baaaa = [UIColor colorWithWhite:0 alpha:0.0];
    ch.backgroundColor = baaaa;
    bo.backgroundColor = baaaa;
    
    [boozeChooserView addSubview:ch];
    [boozeChooserView addSubview:bo];

    
    
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
