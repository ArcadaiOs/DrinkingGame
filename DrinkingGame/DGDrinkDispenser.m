//
//  DGDrinkDispenser.m
//  DrinkingGame
//
//  Created by student on 2/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGDrinkDispenser.h"

@implementation DGDrinkDispenser

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void) showLooser:(DGPlayer *)looser{

    //playerFrame.center = CGPointMake(160, 210);
    //[self.view addSubview:playerFrame];

    [nextPlayerFramePlayer addSubview:playerFrame];
    nextPlayerFrame.center = CGPointMake(160, 210);
    [self.view addSubview:nextPlayerFrame];
    
    [playerImg setImage:looser.image];
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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"DGMenubg.png"]]; 
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
