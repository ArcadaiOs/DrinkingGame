//
//  DGGameTestOne.m
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGGameSimonSays.h"

@implementation DGGameSimonSays

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    
    }
    return self;
}
-(int*) nrOfRands:(int)rands minimi:(int)min maximi:(int)max{
    int *ret;
    ret = (int*) malloc(rands*sizeof(int));
    for(int i=0;i<rands;i++){
        ret[i]=arc4random() % max + min;
    }
    return ret;
}

-(int) getRandomIntMin:(int)min max:(int)max{
    return (int) ((arc4random() % max) + min);
}

-(IBAction)buttonPressed:(id)sender{
    UIButton *button = (UIButton*) sender;
    NSLog(@"BUttonPResed %@", button.titleLabel.text);
    
    
}
-(IBAction) lightRandomColor:(id) sender{
    int b = [self getRandomIntMin:1 max:4];
    NSLog(@"rand %i", b);
    
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
    NSLog(@"simon is loaded");
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
