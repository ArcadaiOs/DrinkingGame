//
//  DGGameTestOne.m
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGGameSimonSays.h"

@implementation DGGameSimonSays{
    
}

@synthesize playList;
@synthesize playEnumerator;

-(id) init{
    self = [super init];
    if(self){
        OnePlayerOnce = false;
        name = @"Simon Says";
    }
    return self;
}

-(void) nextPlay:(NSTimer *)timer{
    
    NSEnumerator* en = (NSEnumerator*) timer.userInfo;
    
    id next = [en nextObject];
    if(next == nil){
        NSLog(@"end of array, start player action");
        [timer invalidate];
        playerAction = true;
        playCount = 0;
        
    } else {
        NSNumber* num = (NSNumber*)next;
        NSLog(@"Timergot: %i", [num intValue]);
        [self flashButton:[num intValue] duration:0.5];
    }
    
}


/*
 Function that starts the gameLoop
 */
-(IBAction) startGame:(id) sender{
    if ([[DGController sharedInstance] fullAuto]) {
        [super startGame];
        return;
    }
    playEnumerator = [playList objectEnumerator];
    
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(nextPlay:)
                                   userInfo:playEnumerator
                                    repeats:true
     ];
    
}

/*
 Resets button highligt state, Button should have reference in the Timer
 */
-(void) timerFired:(NSTimer *)timer {
    UIButton *b = (UIButton*) [timer userInfo];
    b.highlighted = false;
}

/*
 Get some amount of random numbers between min and max values
 */
-(int*) nrOfRands:(int)rands minimi:(int)min maximi:(int)max{
    int *ret;
    
    if(min>max) {
        ret = (int*) malloc(rands*sizeof(int));    
        ret[0] = -1;
    } else {
        ret = (int*) malloc(rands*sizeof(int));
        for(int i=0;i<rands;i++){
            ret[i]=arc4random() % max + min;
        }    
    }
    
    return ret;
    
}
/*
 gets One random number
 */
-(int) getRandomIntMin:(int)min max:(int)max{
    if(min>max)
        return -1;
    else
        return (int) ((arc4random() % max) + min);
}

-(IBAction)buttonPressed:(id)sender{
    UIButton *button = (UIButton*) sender;
   
    switch ([self colorToIntId:button.titleLabel.text]) {
        case 1:
            //BLUE Button press
            //[[SimpleAudioEngine sharedEngine] playEffect:@"g1.mp3"];
            break;
        case 2:
            //Yellow button press
            //[[SimpleAudioEngine sharedEngine] playEffect:@"e1.mp3"];
            break;
        case 3:
            //Red button press
            //[[SimpleAudioEngine sharedEngine] playEffect:@"c1.mp3"];
            break;
        case 4:
            //Green button press
            //[[SimpleAudioEngine sharedEngine] playEffect:@"c2.mp3"];
            break;
    }

    if(playerAction){
        if(playCount < ([playList count]) ){
    //        NSLog(@"COMPARING: BUTTON: %i LIST: %i, COUNT %i", [self colorToIntId:button.titleLabel.text],
      //            [[playList objectAtIndex:playCount] intValue],playCount);
            if([[playList objectAtIndex:playCount] intValue] == [self colorToIntId:button.titleLabel.text] ){
                if(playCount == [playList count]-1){
                    [playList addObject:[[NSNumber alloc] initWithInt:[self getRandomIntMin:1 max:4]]];
                    [self NextPlayer];
                }
                playCount++;        
            } else {
                playCount = 0;
                playerAction = false;
                [[DGController sharedInstance] gameEndedWithLooser:CurrentPlayer];
            }
            
        } else{
            playerAction = false;
            playCount = 0;
           [[DGController sharedInstance] gameEndedWithLooser:CurrentPlayer];
            
        }
        
        
    } else {
        //NSLog(@"should wait");
    }
    
    
}

-(int) colorToIntId:(NSString* )colorName{
    if([colorName compare:@"BLUE"] == NSOrderedSame){
        return 1;
    } else if ([colorName compare:@"YELLOW"] == NSOrderedSame){
        return 2;
    } else if ([colorName compare:@"RED"] == NSOrderedSame){
        return 3;
    } else if ([colorName compare:@"GREEN"] == NSOrderedSame){
        return 4;
    } 
    return 0;
}

-(void) flashButton:(int)buttonNr duration:(float)seconds{
    UIButton *btn;
    switch (buttonNr) {
        case 1:
            btn = blueButton;
            //[[SimpleAudioEngine sharedEngine] playEffect:@"g1.mp3"];
            break;
        case 2:
            btn = yellowButton;
            //[[SimpleAudioEngine sharedEngine] playEffect:@"e1.mp3"];
            break;
        case 3:
            btn = redButton;
            //[[SimpleAudioEngine sharedEngine] playEffect:@"c1.mp3"];
            break;
        case 4:
            btn = greenButton;
            //[[SimpleAudioEngine sharedEngine] playEffect:@"c2.mp3"];
            break;
        default:
            return;
    }
    btn.highlighted = true;
    [NSTimer scheduledTimerWithTimeInterval:seconds
                                     target:self
                                   selector:@selector(timerFired:)
                                   userInfo:btn
                                    repeats:false
     ];
    
    //[btn performSelector:@selector(setHighlighted:) withObject:FALSE afterDelay:seconds];
    
}
-(IBAction) flashRandomColor:(id) sender{
    int b = [self getRandomIntMin:1 max:4];
    [self flashButton:b duration:0.2];
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
-(IBAction)next:(id)sender{

    [playList addObject:[[NSNumber alloc] initWithInt:[self getRandomIntMin:1 max:4]]];
    [playList addObject:[[NSNumber alloc] initWithInt:[self getRandomIntMin:1 max:4]]];

    [self showPlayer:[[[DGController sharedInstance] players] objectAtIndex:currentPlayer]];
    
}

-(void) playerReady{
    NSLog(@"NEXT PLAYER: READY SIMON");
    [self startGame:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void) startGame{
    NSLog(@"SIMON StartGame");
    playerAction = false;
    playList = [[NSMutableArray alloc] init];
    [[[DGController sharedInstance] players]sortUsingSelector:@selector(comparePromille:)];

    // create som starting point values
    int i=4;
    while (i--) {
        int rand = [self getRandomIntMin:1 max:4];
        [playList addObject:[[NSNumber alloc] initWithInt:rand]];
    }

    [self NextPlayer];

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
