//
//  DrinkingGameViewController.m
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DrinkingGameViewController.h"

@implementation DrinkingGameViewController
@synthesize myCounterLabel;
@synthesize s;
@synthesize buttonpushed;
@synthesize count;
- (void)updateCounter:(NSTimer *)theTimer {
	count += 1;
	NSString *a = [[NSString alloc] initWithFormat:@"%d", count];
	self.myCounterLabel.text = a;
	[a release];
    if (buttonpushed == 4){
        [timer invalidate];
        timer = nil;
    }}

- (IBAction)Q1:(id) sender
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
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(updateCounter:)
                                           userInfo:nil
                                            repeats:YES];}

- (IBAction)Q2:(id) sender
{
    [s dismissModalViewControllerAnimated:false];
    int i = arc4random() % 3;
    
    if (buttonpushed == 4)
    {
        [s setView:endView];    }
    
    else if(i == 1)
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
    
    buttonpushed = buttonpushed +1;
   
}




- (IBAction)Lose:(id) sender
{
    [s dismissModalViewControllerAnimated:false];
    int i = arc4random() % 3;
    
    if (buttonpushed == 4)
    {
        [s setView:endView];    }
    
    else if(i == 1)
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
    
    buttonpushed = buttonpushed +1;
    count = count +5;
    
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
    count = 0;
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
