//
//  DGController.h
//  DrinkingGame
//
//  Created by student on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DGDrink.h"
#import "DGPlayer.h"
@interface DGController : NSObject{
    NSMutableArray* drinks;
    NSMutableArray* players;
    DGController * controller;
}
@property (nonatomic, retain) NSMutableArray* drinks;
@property (nonatomic, retain) NSMutableArray* players;
@property (nonatomic, retain) DGController * controller;
- (void)addPlayerWithimage:(UIImage*) imageIn weight:(int)weightIn isFemale:(bool) isFemaleIn;
+(DGController*) getController;
@end
