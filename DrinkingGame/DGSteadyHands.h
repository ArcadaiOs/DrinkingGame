//
//  DGSteadyHands.h
//  DrinkingGame
//
//  Created by JonS on 2/2/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
#import "DGGame.h"
#import "DGController.h"

@interface DGSteadyHands : DGGame <UIAccelerometerDelegate> {
    IBOutlet UILabel *labelX;
    IBOutlet UILabel *labelY;
    IBOutlet UILabel *labelZ;
    IBOutlet UIProgressView *progressX;
    IBOutlet UIProgressView *progressY;
    IBOutlet UIProgressView *progressZ;
    UIAccelerometer *accelerometer;
    double accelvalue;
}
@property(nonatomic,retain) IBOutlet UILabel *labelX;
@property(nonatomic,retain) IBOutlet UILabel *labelY;
@property(nonatomic,retain) IBOutlet UILabel *labelZ;
@property(nonatomic,retain) IBOutlet UIProgressView *progressX;
@property(nonatomic,retain) IBOutlet UIProgressView *progressY;
@property(nonatomic,retain) IBOutlet UIProgressView *progressZ;
@property(nonatomic,retain) UIAccelerometer *accelerometer;

@end
