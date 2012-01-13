//
//  DGSpelare.h
//  DrinkingGame
//
//  Created by Andrej Scherbakov-Parland on 1/13/12.
// Edited bu Jon Ståhlström on 1/13/12
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DGSpelare : NSObject

@property (nonatomic, retain) NSString *gender;
@property (nonatomic, retain) NSNumber *weight;
@property (nonatomic, retain) UIImage *picture;
@property (nonatomic, retain) NSNumber *alcoholQuantity;

@end