//
//  DGTestGameTwo.m
//  DrinkingGame
//
//  Created by JonS on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGTestGameTwo.h"

@implementation DGTestGameTwo
@synthesize speed;
@synthesize mole1,mole2,mole3;
@synthesize scoreLabel;
@synthesize score;
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
    speed= [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:0.4],[NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.8 ], nil];
    score=0;
	[NSTimer scheduledTimerWithTimeInterval:0.8f
                                     target:self
                                   selector:@selector(updateInterval:)
                                   userInfo:nil
                                    repeats:true];
    
        int b = [self getRandomIntMin:1 max:3];
        if(b==1){
             [mole1 setHidden:false];
        
            }
        if(b==2){
            [mole2 setHidden:true];
        
            }
        if(b==1){
            [mole3 setHidden:true];
        
            }
            
    
    
}

-(void)updateInterval:(NSTimer*)theTimer{
   
    [mole1 setHidden:true];
    [mole2 setHidden:true];
    [mole3 setHidden:true];
    
    int b = [self getRandomIntMin:1 max:3];
    if(b==1){
        [mole1 setHidden:false];
        
    }
    if(b==2){
        [mole2 setHidden:false];
        
    }
    if(b==3){
        [mole3 setHidden:false];
        
    }
    
} 
-(IBAction)addScore:(id)sender{
    score=score+1;
    self.scoreLabel.text = [[NSString alloc] initWithFormat:@"%i",score];
    [sender setHidden:true];
}
-(int) getRandomIntMin:(int)min max:(int)max{
    if(min>max)
        return -1;
    else
        return (int) ((arc4random() % max) + min);
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
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
