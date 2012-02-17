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
    int i = arc4random() % 12;
    if(i == 1)
    {
        [s setView:firstView];
    }
    else if(i == 2)
    {
        [s setView:secondView];
    }
    else if(i == 3)
    {
        [s setView:thirdView];
    }
    else if(i == 4)
    {
        [s setView:fourthView];
    }
    else if(i == 5)
    {
        [s setView:fifthView];
    }
    else if(i == 6)
    {
        [s setView:sixthView];
    }
    else if(i == 7)
    {
        [s setView:seventhView];
    }
    else if(i == 8)
    {
        [s setView:eightView];
    }
    else if(i == 9)
    {
        [s setView:ninthView];
    }
    else if(i == 10)
    {
        [s setView:tenthView];
    }
    else if(i == 11)
    {
        [s setView:eleventhView];
    }
    else
    {
        [s setView:twelfthView];
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
    else if(i == 3)
    {
        [s setView:thirdView];
    }
    else if(i == 4)
    {
        [s setView:fourthView];
    }
    else if(i == 5)
    {
        [s setView:fifthView];
    }
    else if(i == 6)
    {
        [s setView:sixthView];
    }
    else if(i == 7)
    {
        [s setView:seventhView];
    }
    else if(i == 8)
    {
        [s setView:eightView];
    }
    else if(i == 9)
    {
        [s setView:ninthView];
    }
    else if(i == 10)
    {
        [s setView:tenthView];
    }
    else if(i == 11)
    {
        [s setView:eleventhView];
    }
    else
    {
        [s setView:twelfthView];
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
    else if(i == 3)
    {
        [s setView:thirdView];
    }
    else if(i == 4)
    {
        [s setView:fourthView];
    }
    else if(i == 5)
    {
        [s setView:fifthView];
    }
    else if(i == 6)
    {
        [s setView:sixthView];
    }
    else if(i == 7)
    {
        [s setView:seventhView];
    }
    else if(i == 8)
    {
        [s setView:eightView];
    }
    else if(i == 9)
    {
        [s setView:ninthView];
    }
    else if(i == 10)
    {
        [s setView:tenthView];
    }
    else if(i == 11)
    {
        [s setView:eleventhView];
    }
    else
    {
        [s setView:twelfthView];
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
