//
//  Q2ViewController.m
//  DrinkingGame
//
//  Created by student on 1/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Q2ViewController.h"
#import "Q3ViewController.h"
#import "LoseViewController.h"

@implementation Q2ViewController
@synthesize myCounterLabel;
- (IBAction)Q3;

{
    
    Q3ViewController *Q3 = [[Q3ViewController alloc] initWithNibName:nil bundle:nil];
    
    [self presentModalViewController:Q3 animated:NO];
    
}
- (IBAction)Lose;

{
    
    LoseViewController *Lose = [[LoseViewController alloc] initWithNibName:nil bundle:nil];
    
    [self presentModalViewController:Lose animated:NO];
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    self.myCounterLabel.text = @"5";
    
	timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(updateCounter:)
                                           userInfo:nil
                                            repeats:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
