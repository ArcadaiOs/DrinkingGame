//
//  DGFillTheBottle.m
//  DrinkingGame
//
//  Created by student on 2/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGFillTheBottle.h"

@implementation DGFillTheBottle
@synthesize moreButton2;
@synthesize countLabel;
@synthesize click;
@synthesize moreButton;
@synthesize pilar;
@synthesize objectHeight;




- (void)updateCounter:(NSTimer *)theTimer {
	
    if((int) self.pilar.frame.size.height > 10){
        static int count = 0;
        count -= 1;
    int subtractor = 5;
	NSString *s = [[NSString alloc]
                   initWithFormat:@"%d", count];
	self.countLabel.text = s;
	[s release];
    
    CGRect old = self.pilar.frame;
    objectHeight = (int) self.pilar.frame.size.height;
    
    objectHeight = objectHeight-subtractor;
    self.pilar.frame = CGRectMake(old.origin.x, old.origin.y+subtractor, old.size.width, objectHeight);
    //NSLog(@"New height:%i", objectHeight);
    //NSLog(@"New y:%f", self.pilar.frame.origin.y);
    }else{
    
        self.countLabel.text = @"Game Over";
        [moreButton setHidden:YES]; 
    
    }
}
-(IBAction)removeHeight:(id)sender{
    
}
- (IBAction)addHeight:(id)sender{
    CGRect old = self.pilar.frame;
    int incremator = 1;
    objectHeight = (int) self.pilar.frame.size.height;
    objectHeight = objectHeight+incremator;
    self.pilar.frame = CGRectMake(old.origin.x, old.origin.y-incremator, old.size.width, objectHeight);
    NSLog(@"New height:%i", objectHeight);
    NSLog(@"New y:%f", self.pilar.frame.origin.y);
}
- (IBAction)doMoreButton:(id)sender {
    NSLog(@"Button is Clicked");
    click=click+1;
    NSString* title = [[NSString alloc] initWithFormat:@"%i", click];
    [moreButton setTitle:title forState:UIControlStateNormal];
    [self addHeight:nil];
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
    click = 0;
    self.countLabel.text = @"0";
    [NSTimer scheduledTimerWithTimeInterval:0.2f
                                     target:self
                                   selector:@selector(updateCounter:)
                                   userInfo:nil
                                    repeats:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setCountLabel:nil];
    [self setMoreButton:nil];
    [self setPilar:nil];
    [self setMoreButton2:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [countLabel release];
    [moreButton release];
    [pilar release];
    [moreButton2 release];
    [super dealloc];
}
@end
