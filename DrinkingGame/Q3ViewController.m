//
//  Q3ViewController.m
//  DrinkingGame
//
//  Created by student on 1/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Q3ViewController.h"
#import "WinViewController.h"
#import "LoseViewController.h"


@implementation Q3ViewController

- (IBAction)Win;

{
    
    WinViewController *Win = [[WinViewController alloc] initWithNibName:nil bundle:nil];
    
    [self presentModalViewController:Win animated:NO];
    
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
