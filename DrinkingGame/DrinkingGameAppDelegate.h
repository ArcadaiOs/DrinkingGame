//
//  DrinkingGameAppDelegate.h
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGController.h"
@class DrinkingGameViewController;

@interface DrinkingGameAppDelegate : NSObject <UIApplicationDelegate>{
    DGController* controller;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet DGController* controller;

@end
