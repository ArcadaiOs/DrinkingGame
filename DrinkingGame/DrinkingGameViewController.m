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
    
    // Release any cached data, images, etc that aren't in use.
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
