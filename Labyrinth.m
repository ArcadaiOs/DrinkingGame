//
//  Labyrinth.m
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Labyrinth.h"
#import "newview.h"

@implementation Labyrinth
@synthesize stopWatchLabel;

@synthesize image1, image2;

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *mytouch = [[event allTouches] anyObject];
    image1.center = [mytouch locationInView:self.view];
   // button.center = [mytouch locationInView:self.view];
    
    [self collision];
}


-(void)collision {
    
    if (CGRectIntersectsRect(image1.frame, image2.frame)) {
        newview *second = [[newview alloc] initWithNibName:nil bundle:nil];
        [self presentModalViewController:second animated:YES];
    }
    
}

-(IBAction)onStartPressed:(id)sender {
    stopWatchLabel.text =@"Start Pressed";
}
-(IBAction)onStopPressed:(id)sender {
    stopWatchLabel.text =@"Stop Pressed";
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
    [self setStopWatchLabel:nil];
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
    [stopWatchLabel release];
    [super dealloc];
}

@end
