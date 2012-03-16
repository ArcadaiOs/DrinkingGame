//
//  DrinkingGameViewController.m
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGLogic.h"

@implementation DGLogic
@synthesize myCounterLabel;
@synthesize s;
@synthesize buttonpushed;
@synthesize penalty;
@synthesize views;
- (void)updateCounter:(NSTimer *)theTimer {
	count += 1;
    if (buttonpushed == 4){
        [timer invalidate];
        timer = nil;
    }}


- (IBAction)Q1:(id) sender
{
    [s dismissModalViewControllerAnimated:false];
    int i = arc4random() % 31;
    [s setView:[views objectAtIndex:i]];    
    [self presentModalViewController:s animated:NO ];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(updateCounter:)
                                           userInfo:nil
                                            repeats:YES];}

- (IBAction)win:(id) sender
{
    [s dismissModalViewControllerAnimated:false];
    int i = arc4random() % 31;
    if (buttonpushed == 4)
    {
        [s setView:endView];
        NSString *a = [[NSString alloc] initWithFormat:@"%i", (penalty+count)];
        self.myCounterLabel.text = a;
        [a release];
    }
    else
    {
        [s setView:[views objectAtIndex:i]];    
    }

    [self presentModalViewController:s animated:NO ];
    
    buttonpushed = buttonpushed +1;
   
}

- (IBAction)Lose:(id) sender
{
    [s dismissModalViewControllerAnimated:false];
    int i = arc4random() % 31;
    penalty = penalty +20;
    if (buttonpushed == 4)
    {
        [s setView:endView];
        NSString *a = [[NSString alloc] initWithFormat:@"%i", (penalty+count)];
        self.myCounterLabel.text = a;
        [a release];
    }
    else{
    [s setView:[views objectAtIndex:i]];    
    }
    [self presentModalViewController:s animated:NO ];
    
    buttonpushed = buttonpushed +1;
    
}

-(void)nextPlayer:(id) sender
{
    [s dismissModalViewControllerAnimated:false];
    [s setView:startView];
    [self presentModalViewController:s animated:NO ];
    buttonpushed = 0;
    penalty = 0;
    count = 0;
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
 views = [[NSMutableArray alloc] initWithObjects:firstView,secondView,thirdView,fourthView,fifthView,sixthView,seventhView,eightView,ninthView,tenthView,eleventhView,twelfthView,thirteenthView,fourteenthView,fifteenthView,sixteenthView,seventeenthView,eighteenthView,nineteenthView,twentiethView,twentyfirstView,twentysecondView,twentythirdView,twentyfourthView,twentyfifthView,twentysixthView,twentyseventhView,twentyeightView,twentyninthView,thirtiethView,thirtyfirstView, nil];
    count = 0;
    penalty = 0;
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
