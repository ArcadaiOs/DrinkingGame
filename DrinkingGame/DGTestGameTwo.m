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
@synthesize scoreLabel,scoreLabelText,playerNameText,playerName,timeLeftText,timeLeft,playerScore;
@synthesize zeroes;
@synthesize molesHit,molesShown,seconds;
@synthesize timer1,timer2;
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
    molesHit=0;
    molesShown=0;
    seconds=40;
    zeroes = @"";
	timer1=[NSTimer scheduledTimerWithTimeInterval:0.4f
                                     target:self
                                   selector:@selector(updateInterval:)
                                   userInfo:nil
                                    repeats:true];
    timer2=[NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self
                                   selector:@selector(updateSeconds:)
                                   userInfo:nil
                                    repeats:true];
    [scoreLabelText setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:16 ] ];
    [scoreLabel setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:16 ] ];
    
    [playerNameText setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:16 ] ];
    [playerName setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:16 ] ];
    
    [timeLeftText setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:24 ] ];
    [timeLeft setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:36 ] ];
    
    [playerScore setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:26 ] ];
    
    
}
-(void)stopTimers:(bool)endGame{
    
    [mole1 setHidden:true];
    [mole2 setHidden:true];
    [mole3 setHidden:true];
    
    [mole1 setEnabled:false];
    [mole2 setEnabled:false];
    [mole3 setEnabled:false];
    
    [scoreLabelText setHidden:true];
    [scoreLabel setHidden:true];
    
    [timeLeftText setHidden:true];
    [timeLeft setHidden:true];
    
    [playerScore setHidden:false];
    
    if(endGame==true){
        NSLog(@"you quitthegame");
        if ((timer1 != nil) && ([timer1 isValid]))
        {
            [timer1 invalidate];     //Causes release
            timer1 = NULL;
        }
        if ((timer2 != nil) && ([timer2 isValid]))
        {
            [timer2 invalidate];     //Causes release
            timer2 = NULL;
        }
    }
    else{
        if(molesHit<50){
            
                 self.playerScore.text=[[NSString alloc] initWithFormat:@"You suck!\n you hit:\n%i/%i corks",molesHit,molesShown];
        
        }
        else{
            
            self.playerScore.text=[[NSString alloc] initWithFormat:@"You're great!\n you hit:\n%i/%i corks",molesHit,molesShown];
            
        }
        if ((timer1 != nil) && ([timer1 isValid]))
        {
            [timer1 invalidate];     //Causes release
            timer1 = NULL;
        }
        if ((timer2 != nil) && ([timer2 isValid]))
        {
            [timer2 invalidate];     //Causes release
            timer2 = NULL;
        }
        
    }
}
-(IBAction)startRounds:(id)sender{

}
-(void)updateSeconds:(NSTimer*)theTimer{
    seconds = seconds-1;
    NSLog(@"%i",seconds);
    if(seconds<10){
        zeroes = @"0";
    }
    self.timeLeft.text = [[NSString alloc] initWithFormat:@"00:%@%i",zeroes,seconds];
    if(seconds==0){
        [self stopTimers:(bool)false];
    }
}
-(void)updateInterval:(NSTimer*)theTimer{
    molesShown = molesShown+1;
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
    molesHit=molesHit+1;
    self.scoreLabel.text = [[NSString alloc] initWithFormat:@"%i",molesHit];
    [sender setHidden:true];
}
-(int) getRandomIntMin:(int)min max:(int)max{
    if(min>max)
        return -1;
    else
        return (int) ((arc4random() % max) + min);
}
-(void)endGame:(id)sender{
    [self stopTimers:(bool)true];
    [super endGame:(id)sender];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [zeroes release];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
