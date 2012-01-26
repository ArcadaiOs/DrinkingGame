//
//  DGGameTestOne.m
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGGameSimonSays.h"

@implementation DGGameSimonSays{
   
  //  IBOutlet UIButton* blueButton;
  //  IBOutlet UIButton* yellowButton;
  //  IBOutlet UIButton* redButton;
  //  IBOutlet UIButton* greenButton;

}

@synthesize playList;


-(void) nextPlay:(NSTimer *)timer{
    
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
-(IBAction) flashRandomColor:(id) sender{
    int b = [self getRandomIntMin:1 max:4];
    UIButton *btn;
    switch (b) {
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
    //btn.isHighlighted = true;
    btn.highlighted = true;
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(timerFired:)
                                   userInfo:btn
                                    repeats:false
     ];
    
    
    NSLog(@"rand %i name: %@", b, btn.currentTitle);
    
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
