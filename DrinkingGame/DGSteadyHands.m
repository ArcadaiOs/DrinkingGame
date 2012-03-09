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
@synthesize accelerattt;
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
@synthesize accelerometer;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
-(id) init{
    self = [super init];
    if(self){
        OnePlayerOnce = true;
        name = @"Steady Hands";
    }
    return self;
}

#pragma mark - View lifecycle
-(void) StartGame{
    self.view=startView;
    points = [[NSMutableDictionary alloc] init];
    currentPlayer=0;
    playerCount = [[DGController sharedInstance] playerCount];
    results = [[NSMutableString alloc] initWithString:@""];
    
    pName = [[[[DGController sharedInstance] players] objectAtIndex:currentPlayer] name];
    
    for (UILabel *nameLabel in nameCollection) {
        nameLabel.text= [[NSString alloc] initWithFormat:@"%@",pName]; 
    }
    
    [self setFonts];
    accelerattt=0;
    // Do any additional setup after loading the view from its nib.

}
- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
}
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    float accX = acceleration.x;
    float accY = acceleration.y;
    float accZ = acceleration.z;
    
    if(accX<0){
        accX = accX*-1;
    }
    if(accY<0){
        accY = accY*-1;
    }
    if(accZ<0){
        accZ = accZ*-1;
    }
    accelerattt=accelerattt+accX+accY+(accZ-1);
    self.scoreLabel.text = [NSString stringWithFormat:@"%@%f", @"X: ", accelerattt];
    accelvalue+=acceleration.x;
    accelvalue+=acceleration.y;
    accelvalue+=acceleration.z;
    self.progressX.progress = ABS(acceleration.x);
    self.progressY.progress = ABS(acceleration.y);
    self.progressZ.progress = ABS(acceleration.z);
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
-(IBAction)startGame:(id)sender
{
    self.view = gameView;
    self.accelerometer = [UIAccelerometer sharedAccelerometer];
    self.accelerometer.updateInterval = .1;
    self.accelerometer.delegate = self;
    
    [scoreLabelText setHidden:NO];
    [scoreLabel setHidden:NO];
    
    [timeLeftText setHidden:NO];
    [timeLeft setHidden:NO];
    
    
    seconds=10;
    
    zeroes = @"";
    
    self.timeLeft.text = [[NSString alloc] initWithFormat:@"00:%@%i",zeroes,seconds];
    
    self.scoreLabel.text = [[NSString alloc] initWithFormat:@"%i",molesHit];
    
    
    
    [self startTimers];
}
-(void)stopTimers:(bool)endGame
{
    [self endTimers];
    NSNumber *point = [[NSNumber alloc] initWithFloat:accelerattt];
    NSNumber *idp = [[NSNumber alloc] initWithInt:currentPlayer];
    [points setObject:point forKey:idp];
    
    
    
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
        
       
        
        
        if ((currentPlayer+1)>= playerCount)
        {
            [nextPlayerBtn setHidden:YES];
            [playerScore setHidden:YES];
            [playerName2 setHidden:YES];
            
            NSArray *keys = [points allKeys];
            
            for (NSNumber *key in keys) 
            {
                int x =[key intValue];
                int p =[[points objectForKey:key] intValue];
                [results appendFormat:@"NAME: %@ , POINTS:%i \n",[[[[DGController sharedInstance] players] objectAtIndex:x] name], p];
                
            }
            
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
   
    
} 
-(IBAction)addScore:(id)sender
{
  
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
   [self setAccelerometer:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)dealloc{

    [accelerometer release];
}
@end
