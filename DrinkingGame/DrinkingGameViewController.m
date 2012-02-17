//
//  DrinkingGameViewController.m
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DrinkingGameViewController.h"


@implementation DrinkingGameViewController
@synthesize controller;
@synthesize delegate;
-(id)init{
    self = [super init];
    if (self) {
        [controller setDelegate:self];
    }
    return self;
    
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

//    [self.view addSubview:nextPlayerView];
    
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
    [controller setDelegate:self];
    //[ctrl fetchRecords];
    viewControl = [[UIViewController alloc] init];
    [viewControl setView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"DGmenubg.png"]]];
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
