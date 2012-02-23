//
//  DGRandomShot.m
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGRandomShot.h"

@implementation DGRandomShot

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
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"DGmenubg.png"]];
    UIImageView *arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow.png"]];
    arrow.frame = CGRectMake(150, 150, 150, 150);
    arrow.transform = CGAffineTransformMakeRotation(M_PI_2+M_PI_4); //rotation in radians
    
    UILabel* header = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 70)];
    [header setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:35]];
    header.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    header.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    header.text = @"Random shot";
    header.textAlignment = UITextAlignmentCenter;
    
    UILabel* subHeader = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 300, 70)];
    [subHeader setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:20]];
    subHeader.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    subHeader.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    subHeader.text = @"Who has to drink?";
    subHeader.textAlignment = UITextAlignmentCenter;
    
    
    int sel = arc4random() % [[controller players] count];
    //DGRandomShotWheel* d = [[DGRandomShotWheel alloc] initWithFrame:CGRectMake(-320, 140, 640, 640) andController:controller andSelection:sel];
    DGRandomShotWheel* d = [[DGRandomShotWheel alloc] initWithFrame:CGRectMake(0, 100, 320, 320) andController:controller andSelection:sel];
    [self.view insertSubview:d atIndex:2];
    //[self.view insertSubview:arrow atIndex:3];
    [self.view insertSubview:header atIndex:4];
    [self.view insertSubview:subHeader atIndex:4];
    [d spin];
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
- (void)drawRect:(CGRect)rect {
    NSLog(@"draw");
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat components[] = {0.0, 0.0, 1.0, 1.0};
    
    CGColorRef color = CGColorCreate(colorspace, components);
    
    CGContextSetStrokeColorWithColor(context, color);
    
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 300, 400);
    
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
}

@end
