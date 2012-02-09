//
//  DrinkingGameViewController.m
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DrinkingGameViewController.h"
#import "LoseViewController.h"

@implementation DrinkingGameViewController
@synthesize myCounterLabel;
@synthesize s;

- (IBAction)Q2:(id) sender
{
    [s dismissModalViewControllerAnimated:false];
    int i = arc4random() % 3;
    if(i == 1)
    {
        [s setView:firstView];
    }
    else if(i == 2)
    {
        [s setView:secondView];
    }
    else
    {
        [s setView:thirdView];
    }
    
    //[s setView:firstView];

    [self presentModalViewController:s animated:NO ];
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
    
    if (count == 0) {
        LoseViewController *Lose = [[LoseViewController alloc] initWithNibName:nil bundle:nil];
        
        [self presentModalViewController:Lose animated:NO];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    s = [[UIViewController alloc] init];
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
