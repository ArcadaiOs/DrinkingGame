//
//  DGTestGameTwo.m
//  DrinkingGame
//
//  Created by JonS on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGTestGameTwo.h"

@implementation DGTestGameTwo
/*BUTTONS*/
@synthesize mole1,mole2,mole3,nextPlayerBtn,quitPlayingBtn,startPlayingBtn;
/*LABELS*/
@synthesize scoreLabel,scoreLabelText,playerNameText,playerName,playerName2, timeLeftText,timeLeft,playerScore,resultTitle,playerScores,yourUpNext,playerName0;
/*STRINGS*/
@synthesize zeroes,pName,results;
/*ARRAYS*/
@synthesize buttonWithFonts,nameCollection;
/*INT*/
@synthesize molesHit,molesShown,seconds,maxMoles,playerCount,currentPlayer;
/*TIMERS*/
@synthesize timer1,timer2;
/*DICTIONARIES*/
@synthesize points;
/*VIEWS*/
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
    
}
-(IBAction)startGame:(id)sender
{
    if ([[DGController sharedInstance] fullAuto]) {
        [super startGame];
        return;
    }
    //    self.view=startView;
    points = [[NSMutableDictionary alloc] init];
    currentPlayer=0;
    [self showPlayer:[[[DGController sharedInstance] players] objectAtIndex:currentPlayer]];
    //    playerCount = [[DGController sharedInstance] playerCount];
    playerCount = 3;
    
    results = [[NSMutableString alloc] initWithString:@""];
    
    pName = [[[[DGController sharedInstance] players] objectAtIndex:currentPlayer] name];
    
    for (UILabel *nameLabel in nameCollection) {
        nameLabel.text= [[NSString alloc] initWithFormat:@"%@",pName]; 
    }
    
    [self setFonts];
    
}
-(void)setFonts
{
    for (UIButton *buttonF in buttonWithFonts) {
        buttonF.titleLabel.font= [UIFont fontWithName:@"Rockwell Extra Bold" size:26 ];
    }
    quitPlayingBtn.titleLabel.font= [UIFont fontWithName:@"Rockwell Extra Bold" size:12 ];
    [scoreLabelText setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:16 ] ];
    [scoreLabel setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:16 ] ];
    [playerNameText setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:16 ] ];
    [playerName0 setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:30 ] ];
    [playerName setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:16 ] ];
    [playerName2 setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:26 ] ];
    [timeLeftText setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:26 ] ];
    [timeLeft setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:36 ] ];
    [playerScore setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:26 ] ];
    [resultTitle setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:26 ] ];
    [playerScores setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:22 ] ];
    [yourUpNext setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:26 ] ];
}
-(void)startTimers
{    
	timer1=[NSTimer scheduledTimerWithTimeInterval:0.6f
                                            target:self
                                          selector:@selector(updateIntervalForMoles:)
                                          userInfo:nil
                                           repeats:true];
    timer2=[NSTimer scheduledTimerWithTimeInterval:1.0f
                                            target:self
                                          selector:@selector(updateSeconds:)
                                          userInfo:nil
                                           repeats:true];
}
-(void) playerReady{
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
    
    self.scoreLabel.text = [[NSString alloc] initWithFormat:@"%i",molesHit];
    
    
    
    [self startTimers];

}
-(id) init{
    self = [super init];
    if(self){
        OnePlayerOnce = true;
        name = @"Whack A Mole";
    }
    return self;

    
}
//-(IBAction)startGame:(id)sender
//{
//    self.view = gameView;
//    [mole1 setEnabled:true];
//    [mole2 setEnabled:true];
//    [mole3 setEnabled:true];
//    
//    [scoreLabelText setHidden:NO];
//    [scoreLabel setHidden:NO];
//
//    [timeLeftText setHidden:NO];
//    [timeLeft setHidden:NO];
//    
//    molesHit=0;
//    molesShown=0;
//    seconds=30;
//    maxMoles=(seconds/0.6);
//    zeroes = @"";
//    
//    self.timeLeft.text = [[NSString alloc] initWithFormat:@"00:%@%i",zeroes,seconds];
// 
//    self.scoreLabel.text = [[NSString alloc] initWithFormat:@"%i",molesHit];
//
//  
//    
//    [self startTimers];
//}
-(void)stopTimers:(bool)endGame
{
    [self endTimers];
    NSNumber *point = [[NSNumber alloc] initWithInt:molesHit];
    NSNumber *idp = [[NSNumber alloc] initWithInt:currentPlayer];
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
    
    if(endGame==true)
    {
        NSLog(@"you quitthegame");
    }
    else{
         self.view=endView;
        
         if(molesHit<(maxMoles/2))
         {
                 self.playerScore.text=[[NSString alloc] initWithFormat:@"You suck!\n you hit:\n%i/%i corks",molesHit,molesShown];
        
         }
        else{
            self.playerScore.text=[[NSString alloc] initWithFormat:@"You're great!\n you hit:\n%i/%i corks",molesHit,molesShown];
            
        }
        
        
        if ((currentPlayer+1)>= playerCount)
        {
            [nextPlayerBtn setHidden:YES];
            [playerScore setHidden:YES];
            [playerName2 setHidden:YES];
            int minId=0;
            int min=10000;
            NSArray *keys = [points allKeys];
            for (NSNumber *key in keys) 
            {   
                
                int x =[key intValue];
                 
                int p =[[points objectForKey:key] intValue];
                
                if(p<min){
                    min=p;
                    minId = [key intValue];
                }
                [results appendFormat:@"NAME: %@ , POINTS:%i \n",[[[[DGController sharedInstance] players] objectAtIndex:x] name], p];
                
                
            }
            NSLog(@"%i",minId);
            [[DGController sharedInstance] gameEndedWithLooser:[[[DGController sharedInstance] players] objectAtIndex:minId]];
           self.playerScores.text=[[NSString alloc] initWithFormat:@"%@",results];
            
            [resultTitle setHidden:NO];
            [playerScores setHidden:NO];
        }
        
        else if ((currentPlayer+1)< playerCount)
        {
            [nextPlayerBtn setHidden:NO];
        }
        
    }
}
-(void)startNextPlayer:(id)sender
{
    currentPlayer++;
    pName = [[[[DGController sharedInstance] players] objectAtIndex:currentPlayer] name];
    for (UILabel *nameLabel in nameCollection) 
    {
        nameLabel.text= [[NSString alloc] initWithFormat:@"%@",pName]; 
    }
    self.view=startView;
    [self showPlayer:[[[DGController sharedInstance] players] objectAtIndex:currentPlayer]];
}

-(void)updateSeconds:(NSTimer*)theTimer
{
    seconds = seconds-1;
    NSLog(@"%i",seconds);
    if(seconds<10)
    {
        zeroes = @"0";
    }
    self.timeLeft.text = [[NSString alloc] initWithFormat:@"00:%@%i",zeroes,seconds];
    if(seconds==0)
    {
        [self stopTimers:(bool)false];
    }
}
-(void)updateIntervalForMoles:(NSTimer*)theTimer
{
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
-(IBAction)addScore:(id)sender
{
    molesHit=molesHit+1;
    self.scoreLabel.text = [[NSString alloc] initWithFormat:@"%i",molesHit];
    [sender setHidden:true];
}
-(void)endTimers
{
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
-(int) getRandomIntMin:(int)min max:(int)max
{
    if(min>max)
        return -1;
    else
        return (int) ((arc4random() % max) + min);
}
-(void)endGame:(id)sender
{
    [self stopTimers:(bool)true];
    [super endGame:(id)sender];
}
- (void)viewDidUnload
{
    
       
    nextPlayerBtn = nil;
    startPlayingBtn = nil;
    quitPlayingBtn = nil;
    mole3 = nil;
    mole2 = nil;
    mole1 = nil;
    
    zeroes=nil;
    pName=nil;
    results=nil;
    
    [self setButtonWithFonts:nil];
    [self setNameCollection:nil];
    [self setScoreLabel:nil];
    [self setScoreLabelText:nil];
    [self setPlayerNameText:nil];
    [self setPlayerName:nil];
    [self setPlayerName2:nil];
    [self setTimeLeftText:nil];
    [self setTimeLeft:nil];
    [self setPlayerScore:nil];
    [self setResultTitle:nil];
    [self setPlayerScores:nil];
    [self setPlayerName0:nil];
    [self setYourUpNext:nil];
     
    [self setStartPlayingBtn:nil];
    [self setNextPlayerBtn:nil];
    [self setQuitPlayingBtn:nil];
    [self setMole1:nil];
    [self setMole2:nil];
    [self setMole3:nil];
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

- (void)dealloc {
    
    [mole3 release];
    [mole2 release];
    [mole1 release];
    [quitPlayingBtn release];
    [nextPlayerBtn release];
    [startPlayingBtn release];
    
    [scoreLabel release];
    [scoreLabelText release];
    [playerNameText release];
    [playerName release];
    [playerName2 release];
    [timeLeftText release];
    [timeLeft release];
    [playerScore release];
    [resultTitle release];
    [playerScores release];
    [playerName0 release];
    [yourUpNext release];
    
    [zeroes release];
    [pName release];
    [results release];

    [buttonWithFonts release];
    [nameCollection release];
    
    [timer1 release];
    [timer2 release];
    
    [points release];
    
    [startView release];
    [gameView release];
    [endView release];
    
    [super dealloc];
}
@end
