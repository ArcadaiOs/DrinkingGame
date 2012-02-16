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
@synthesize dispenser;

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
    dispenser = [[DGDrinkDispenser alloc]init];
    [self.view addSubview:dispenser.view];
    [dispenser showLooser:[controller.players objectAtIndex:0]];
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
