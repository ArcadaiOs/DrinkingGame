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


-(void) nextPlay:(NSTimer *)timer{
    
    NSEnumerator* en = (NSEnumerator*) timer.userInfo;
    
    id next = [en nextObject];
    if(next == nil){
        NSLog(@"end of array");
        [timer invalidate];
    } else {
        NSNumber* num = (NSNumber*)next;
        NSLog(@"Timergot: %i", [num intValue]);
        [self flashButton:[num intValue] duration:0.2];
    }
    
}
-(IBAction) startGame:(id) sender{
    playEnumerator = [playList objectEnumerator];
    
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(nextPlay:)
                                   userInfo:playEnumerator
                                    repeats:true
     ];
    
}
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
-(int*) nrOfRands:(int)rands minimi:(int)min maximi:(int)max{
    int *ret;
    ret = (int*) malloc(rands*sizeof(int));
    for(int i=0;i<rands;i++){
        ret[i]=arc4random() % max + min;
    }
    return ret;
}

-(int) getRandomIntMin:(int)min max:(int)max{
    return (int) ((arc4random() % max) + min);
}

-(IBAction)buttonPressed:(id)sender{
    UIButton *button = (UIButton*) sender;
    NSLog(@"BUttonPResed %@", button.titleLabel.text);
    
    
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
