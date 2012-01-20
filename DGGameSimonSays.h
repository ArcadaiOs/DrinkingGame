//
//  DGGameTestOne.h
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGGame.h"
#import <stdlib.h>
#import <time.h>

@interface DGGameSimonSays : DGGame{
    
    
}


-(int*) nrOfRands:(int) rands minimi:(int) min maximi:(int) max;
-(int) getRandomIntMin:(int) min max:(int) max;

-(IBAction) buttonPressed:(id)sender;

-(IBAction) lightRandomColor:(id)sender;

@end
