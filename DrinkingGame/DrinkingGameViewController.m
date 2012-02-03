//
//  DrinkingGameViewController.m
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DrinkingGameViewController.h"
#import "Q2ViewController.h"
#import "LoseViewController.h"

@implementation DrinkingGameViewController

@synthesize myCounterLabel;

- (IBAction)Q2;

{
    
    Q2ViewController *Q2 = [[Q2ViewController alloc] initWithNibName:nil bundle:nil];
    
    [self presentModalViewController:Q2 animated:NO];
    
}
- (IBAction)Lose;

{
    
    LoseViewController *Lose = [[LoseViewController alloc] initWithNibName:nil bundle:nil];
    
    [self presentModalViewController:Lose animated:NO];
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)updateCounter:(NSTimer *)theTimer {
	static int count = 5;
	count -= 1;
	NSString *s = [[NSString alloc] initWithFormat:@"%d", count];
	self.myCounterLabel.text = s;
	[s release];
    }

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myCounterLabel.text = @"5";
    
	timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(updateCounter:)
                                   userInfo:nil
                                    repeats:YES];}

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
