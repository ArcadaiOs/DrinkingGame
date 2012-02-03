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
    // Do any additional setup after loading the view from its nib.
    int i = arc4random() % [[controller players] count];
    img.contentMode = UIViewContentModeScaleAspectFill;
    //[img  setImage:[[[controller players] objectAtIndex:i] image]];
    DGRandomShotWheel* d = [[DGRandomShotWheel alloc] initWithFrame:CGRectMake(-320, 160, 640, 640) andController:controller];
    [self.view addSubview:d];
    
    CABasicAnimation* spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    float spin = 5*2*M_PI;
    spinAnimation.toValue = [NSNumber numberWithFloat:5*2*M_PI];
    [spinAnimation setDuration:spin];
    [d.layer addAnimation:spinAnimation forKey:@"spinAnimation"];
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
