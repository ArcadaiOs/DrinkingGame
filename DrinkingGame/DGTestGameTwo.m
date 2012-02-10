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
@synthesize scoreLabel,scoreLabelText,playerNameText,playerName,timeLeftText,timeLeft;
@synthesize zeroes;
@synthesize score,seconds;
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
    seconds=45;
    [zeroes setString:@""];
	[NSTimer scheduledTimerWithTimeInterval:0.5f
                                     target:self
                                   selector:@selector(updateInterval:)
                                   userInfo:nil
                                    repeats:true];
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self
                                   selector:@selector(updateSeconds:)
                                   userInfo:nil
                                    repeats:true];
    [scoreLabelText setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:24 ] ];
    [scoreLabel setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:24 ] ];
    
    [playerNameText setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:24 ] ];
    [playerName setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:24 ] ];
    
    [timeLeftText setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:34 ] ];
    [timeLeft setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:50 ] ];
    
    
    
}
-(IBAction)startRounds:(id)sender{

}
-(void)updateSeconds:(NSTimer*)theTimer{
    seconds = seconds-1;
    if(seconds<10){
        [zeroes setString:@"0"];
    }
    self.timeLeft.text = [[NSString alloc] initWithFormat:@"00:%@%i",zeroes,seconds];
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
