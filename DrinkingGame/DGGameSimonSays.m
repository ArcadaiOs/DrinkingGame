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

-(void) nextPlay:(NSTimer *)timer{
    
    NSEnumerator* en = (NSEnumerator*) timer.userInfo;
    
    id next = [en nextObject];
    if(next == nil){
        NSLog(@"end of array, start player action");
        [timer invalidate];

        //playEnumerator = [playList objectEnumerator];
        playerAction = true;
        playCount = 0;
        
    } else {
        NSNumber* num = (NSNumber*)next;
        NSLog(@"Timergot: %i", [num intValue]);
        [self flashButton:[num intValue] duration:0.2];
    }
    
}


/*
 Function that starts the gameLoop
*/
-(IBAction) startGame:(id) sender{
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
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    
    }
    return self;
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
    //NSLog(@"BUttonPResed %@", button.titleLabel.text);
    if(playerAction){
        
        if(playCount < ([playList count]) ){
            NSLog(@"COMPARING: BUTTON: %i LIST: %i, COUNT %i", [self colorToIntId:button.titleLabel.text],
                  [[playList objectAtIndex:playCount] intValue],playCount);
            
            if([[playList objectAtIndex:playCount] intValue] == [self colorToIntId:button.titleLabel.text] ){
                if(playCount == [playList count]-1){
                    NSLog(@"WIN");
                    [self flashButton:1 duration:2.0f];
                    [self flashButton:2 duration:2.0f];
                    [self flashButton:3 duration:2.0f];
                    [self flashButton:4 duration:2.0f];
                }
                
                playCount++;        
            } else {
                NSLog(@"PLAYER FAIL");
                playCount = 0;
                playerAction = false;
                
            }
            
            } else{
            NSLog(@"PLAYER FAIL");
            
            playerAction = false;
            playCount = 0;
        }
        
        
    } else {
        NSLog(@"should wait");
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
            break;
        case 2:
            btn = yellowButton;
            break;
        case 3:
            btn = redButton;
            break;
        case 4:
            btn = greenButton;
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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    playerAction = false;
    NSLog(@"simon is loaded");
    playList = [[NSMutableArray alloc] init];


    // create som starting point values
    int i=5;
    while (i--) {
        int rand = [self getRandomIntMin:1 max:4];
        [playList addObject:[[NSNumber alloc] initWithInt:rand]];
        NSLog(@"added: %i",rand);
    }
    
    // iterate through the playList
    NSEnumerator * enumerator = [playList objectEnumerator];
    id element;
    
    while(element = [enumerator nextObject])
    {
        // Do your thing with the object.
        NSLog( @"got: %i", [(NSNumber*)element intValue]);
    }

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
