//
//  DGTestGameTwo.m
//  DrinkingGame
//
//  Created by JonS on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGTestGameTwo.h"

@implementation DGTestGameTwo

@synthesize mole1,mole2,mole3;
@synthesize scoreLabel,scoreLabelText,playerNameText,playerName,playerName2, timeLeftText,timeLeft,playerScore,resultTitle,playerScores;

@synthesize zeroes,pName,results;
@synthesize nameCollection;
@synthesize molesHit,molesShown,seconds,maxMoles,playerCount,currentPlayer;
@synthesize timer1,timer2;
@synthesize points;
@synthesize startView,gameView,endView;
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
    self.view=startView;
    currentPlayer=0;
    
    
    results = [[NSMutableString alloc] initWithString:@""];

    playerCount = [controller playerCount];
    points = [[NSMutableDictionary alloc] init];
    [self setFonts];

    
}
-(void)setFonts{
    [scoreLabelText setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:16 ] ];
    [scoreLabel setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:16 ] ];
    
    [playerNameText setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:16 ] ];
    [playerName setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:16 ] ];
    [playerName2 setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:16 ] ];
    [timeLeftText setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:24 ] ];
    [timeLeft setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:36 ] ];
    
    [playerScore setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:26 ] ];
    
    [resultTitle setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:26 ] ];
    
    [playerScores setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:26 ] ];
}
-(void)startTimers{

    
	timer1=[NSTimer scheduledTimerWithTimeInterval:0.6f
                                            target:self
                                          selector:@selector(updateInterval:)
                                          userInfo:nil
                                           repeats:true];
    timer2=[NSTimer scheduledTimerWithTimeInterval:1.0f
                                            target:self
                                          selector:@selector(updateSeconds:)
                                          userInfo:nil
                                           repeats:true];
}
-(IBAction)startGame:(id)sender{
    self.view = gameView;
    [mole1 setEnabled:true];
    [mole2 setEnabled:true];
    [mole3 setEnabled:true];
    [scoreLabelText setHidden:NO];
    [scoreLabel setHidden:NO];
    
    [timeLeftText setHidden:NO];
    [timeLeft setHidden:NO];
    molesHit=0;
    molesShown=0;
    seconds=30;
    maxMoles=(seconds/0.6);
    zeroes = @"";
    self.timeLeft.text = [[NSString alloc] initWithFormat:@"00:%@%i",zeroes,seconds];
    pName = [[[controller players] objectAtIndex:currentPlayer] name];
 
    self.scoreLabel.text = [[NSString alloc] initWithFormat:@"%i",molesHit];
    NSLog(@"%i %@",currentPlayer,pName);
    self.view = gameView;
    [self startTimers];
    for (UILabel *nameLabel in nameCollection) {
        nameLabel.text= [[NSString alloc] initWithFormat:@"%@",pName]; 
    }
}


-(void)stopTimers:(bool)endGame{
    NSNumber *point = [[NSNumber alloc] initWithInt:molesHit];
    NSNumber *idp = [[NSNumber alloc ] initWithInt:currentPlayer];
    [points setObject:point forKey:idp];
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
        [self endTimers];
        NSLog(@"you quitthegame");
            }
    else{
        [self endTimers];
        
         if(molesHit<(maxMoles/2)){
            
                 self.playerScore.text=[[NSString alloc] initWithFormat:@"You suck!\n you hit:\n%i/%i corks",molesHit,molesShown];
        
        }
        else{
            
            self.playerScore.text=[[NSString alloc] initWithFormat:@"You're great!\n you hit:\n%i/%i corks",molesHit,molesShown];
            
        }
        
        self.view=endView;
        if ((currentPlayer+1)>= playerCount) {
            [nextPlayer setHidden:YES];
            [playerScore setHidden:YES];
            NSArray *keys = [points allKeys];
            
            // values in foreach loop
            for (NSNumber *key in keys) {
                int x =[key intValue];
                int p =[[points objectForKey:key] intValue];
                [results appendFormat:@"NAME: %@ , POINTS:%i \n",[[[controller players] objectAtIndex:x] name], p];
                
            }
            
           self.playerScores.text=[[NSString alloc] initWithFormat:@"%@",results];
            [resultTitle setHidden:NO];
            [playerScores setHidden:NO];
        }
        else if ((currentPlayer+1)< playerCount){
            [nextPlayer setHidden:NO];
            currentPlayer++;
        }
        
    }
}
-(void)nextPlayer:(id)sender{
    self.view=startView;
}
-(void)endTimers{
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
    [nextPlayer release];
    nextPlayer = nil;
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

- (void)dealloc {
    [nextPlayer release];
    [super dealloc];
}
@end
