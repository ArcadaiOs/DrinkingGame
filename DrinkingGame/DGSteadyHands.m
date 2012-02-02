//
//  DGSteadyHands.m
//  DrinkingGame
//
//  Created by student on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGSteadyHands.h"

@implementation DGSteadyHands
@synthesize labelX,labelY,labelZ,progressX,progressY,progressZ;
@synthesize accelerometer;

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
    self.accelerometer = [UIAccelerometer sharedAccelerometer];
    self.accelerometer.updateInterval = .1;
    self.accelerometer.delegate = self;
    
}
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    labelX.text = [NSString stringWithFormat:@"%@%f", @"X: ", acceleration.x];
    labelY.text = [NSString stringWithFormat:@"%@%f", @"Y: ", acceleration.y];
    labelZ.text = [NSString stringWithFormat:@"%@%f", @"Z: ", acceleration.z];
    accelvalue+=acceleration.x;
    accelvalue+=acceleration.y;
    accelvalue+=acceleration.z;
    self.progressX.progress = ABS(acceleration.x);
    self.progressY.progress = ABS(acceleration.y);
    self.progressZ.progress = ABS(acceleration.z);
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
