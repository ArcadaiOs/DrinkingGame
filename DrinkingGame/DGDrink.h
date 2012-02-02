//
//  DGDrink.h
//  DrinkingGame
//
//  Created by student on 1/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DGDrink : NSObject{
    NSNumber * volumeCl;
    NSNumber * procent;
    NSString * name;
}
@property (nonatomic, retain) NSNumber * volumeCl;
@property (nonatomic, retain) NSNumber * procent;
@property (nonatomic, retain) NSString * name;
- (id)initWithVolumeCl: (float) volumeCl procent: (float) procent andName:(NSString*) name;
@end
