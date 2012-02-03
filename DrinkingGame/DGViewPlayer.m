//
//  DGViewPlayer.m
//  DrinkingGame
//
//  Created by student on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGViewPlayer.h"

@implementation DGViewPlayer

@synthesize delegate;

-(void) setPlayer:(DGPlayer *)newPlayer{

    [playerImage setImage:[newPlayer image]];
    [promilLabel setText:[NSString stringWithFormat:@"%f", [[newPlayer promille] floatValue]]];
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
-(IBAction)done:(id)sender{
    if([delegate respondsToSelector:@selector(playerReady)]){
        [delegate playerReady];
    }
    self.view.alpha = 0.0;
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"prom: %@", promilLabel.text);
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
