//
//  DGFillTheBottle.m
//  DrinkingGame
//
//  Created by student on 2/10/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGFillTheBottle.h"


@implementation DGFillTheBottle
@synthesize startPlayingBtn, playerName0, playerName2, playerScore, resultTitle, playerScores, nextPlayerBtn, quitPlayingBtn, startView, gameView, endView, yourUpNext, btnGreen, btnRed, countTimer, objectHeight, pilar, click, timeLabelText, timerLabel, moreButton, moreButton2, currentPlayer, playerCount, points, nameCollection, pInfo, pName, results;

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
    //self.view=self.startView;
    points = [[NSMutableDictionary alloc] init];
    currentPlayer = 0;
    //playerCount = [controller playerCount];
    playerCount = 2;
    results = [[NSMutableString alloc] initWithString:@""];
     [self showPlayer:[controller.players objectAtIndex:currentPlayer]];
    pName = [[[controller players] objectAtIndex:currentPlayer] name];
    
    for (UILabel *nameLabel in nameCollection) {
        nameLabel.text= [[NSString alloc] initWithFormat:@"%@",pName]; 
    }
    
    [timeLabelText setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:22 ] ];
    [timerLabel setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:26 ] ];
    [playerScore setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:26 ] ];
    [resultTitle setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:26 ] ];
    [playerScores setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:22 ] ];
    [yourUpNext setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:26 ] ];
    [playerName0 setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:30 ] ];
    [playerName2 setFont:[UIFont fontWithName:@"Rockwell Extra Bold" size:26 ] ];
     
}
-(void)startTimers
{    
	[NSTimer scheduledTimerWithTimeInterval:0.2f
                                     target:self
                                   selector:@selector(updateCounter:)
                                   userInfo:nil
                                    repeats:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self
                                   selector:@selector(timeCounter:)
                                   userInfo:nil
                                    repeats:YES];
}
- (void)updateCounter:(NSTimer *)theTimer {
	if(timeForGame == 0 || (int) self.pilar.frame.size.height <= 3 ){
         int score = click*self.pilar.frame.size.height/(timeForGame+1);
//        [moreButton setHidden:YES];
//        [moreButton2 setHidden:YES];
        [theTimer invalidate];
        NSLog(@"Score:%i", score);
        NSLog(@"End height:%i", (int) self.pilar.frame.size.height);
        NSLog(@"End time:%i", timeForGame);
        NSLog(@"Total clicks:%i", click);
        [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
        [self timersEnded];
    }
    else{
        static int count = 0;
        count -= 1;
        int subtractor = 3;
        
        CGRect old = self.pilar.frame;
        objectHeight = (int) self.pilar.frame.size.height;
        
        objectHeight = objectHeight-subtractor;
        self.pilar.frame = CGRectMake(old.origin.x, old.origin.y+subtractor, old.size.width, objectHeight);
        
    }
}

-(void)playerReady{
    self.view = gameView;
    btnGreen = [UIImage imageNamed:@"greenPlusButton.png"];
    btnRed = [UIImage imageNamed:@"redPlusButton.png"];
    [moreButton2 setImage:btnRed forState:UIControlStateNormal];
    [moreButton setImage:btnGreen forState:UIControlStateNormal];
    click = 0;
    i = 0;
    //score = 0;
    timeForGame = 5;
    CGRect old = self.pilar.frame;
    self.pilar.frame = CGRectMake(old.origin.x, 122, old.size.width, 180);
//    self.pilar.frame.size.height = 175;
    [[SimpleAudioEngine sharedEngine] setBackgroundMusicVolume :0.2f];
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"emptybeerglass.mp3"];
    [self startTimers];
}
-(void)startNextPlayer:(id)sender
{
    currentPlayer++;
    pName = [[[controller players] objectAtIndex:currentPlayer] name];
    for (UILabel *nameLabel in nameCollection) 
    {
        nameLabel.text= [[NSString alloc] initWithFormat:@"%@",pName]; 
    }
    //self.view=startView;
    [self showPlayer:[controller.players objectAtIndex:currentPlayer]];
}
- (void)timeCounter:(NSTimer *)theTimer {
    NSString *t = [[NSString alloc]
                   initWithFormat:@"%d", --timeForGame];
    self.timerLabel.text = t;
    if(timeForGame <= 0){
        [theTimer invalidate];
        
    }
}
-(void)timersEnded{
    NSNumber *point = [[NSNumber alloc] initWithInt:10];
    NSNumber *idp = [[NSNumber alloc] initWithInt:currentPlayer];
    [points setObject:point forKey:idp];
     self.view=endView;
    int minId=0;
    int min=10000;
    NSArray *keys = [points allKeys];

    if((currentPlayer+1)>= playerCount){
        for (NSNumber *key in keys) 
        {   
            
            int x =[key intValue];
            
            int p =[[points objectForKey:key] intValue];
            
            if(p<min){
                min=p;
                minId = [key intValue];
            }
            [results appendFormat:@"NAME: %@ , POINTS:%i \n",[[[controller players] objectAtIndex:x] name], p];
            
            
        }
        [delegate GameEndedWithLooser:[[controller players] objectAtIndex:1]];

    }
    else if ((currentPlayer+1)< playerCount)
    {
        
       
        NSLog(@"playercunt:%i\n",playerCount);
        NSLog(@"current:%i\n",currentPlayer);
        [nextPlayerBtn setHidden:NO];

    }
    
}
- (IBAction)addHeight:(id)sender{
    CGRect old = self.pilar.frame;
    int incremator = 1;
    objectHeight = (int) self.pilar.frame.size.height;
    objectHeight = objectHeight+incremator;
    self.pilar.frame = CGRectMake(old.origin.x, old.origin.y-incremator, old.size.width, objectHeight);
    NSLog(@"New height:%i", objectHeight);
}
- (IBAction)doMoreButton:(id)sender {
    click=click+1;
    [[SimpleAudioEngine sharedEngine] playEffect:@"cork.aif"];
    [self addHeight:nil];
    if (self.moreButton.isUserInteractionEnabled && i == 0){
        i = 1;
    }else{
        i = 0;
        if ([moreButton isUserInteractionEnabled]){
            self.moreButton.userInteractionEnabled=NO;
            self.moreButton2.userInteractionEnabled=YES;
            [moreButton setImage:btnRed forState:UIControlStateNormal];
            [moreButton2 setImage:btnGreen forState:UIControlStateNormal];
        }else{
            self.moreButton2.userInteractionEnabled=NO;
            self.moreButton.userInteractionEnabled=YES;
            [moreButton2 setImage:btnRed forState:UIControlStateNormal];
            [moreButton setImage:btnGreen forState:UIControlStateNormal];
        }
    }
}

- (void)viewDidUnload
{
    [self setMoreButton:nil];
    [self setPilar:nil];
    [self setMoreButton2:nil];
    [self setTimerLabel:nil];
    [self setTimeLabelText:nil];
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
    [moreButton release];
    [pilar release];
    [moreButton2 release];
    [timerLabel release];
    [timeLabelText release];
    [super dealloc];
}
@end
