//
//  DrinkingGameAppDelegate.h
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

//#define FULL_AUTO (YES);
//#define TESTING (NO);
//#define TWITTING (NO);

#import <UIKit/UIKit.h>
#import "DGController.h"
@class DrinkingGameViewController;
@protocol TabBarHidder <NSObject>
    -(void) ViewTabBar:(BOOL) Visible;
@end

@interface DrinkingGameAppDelegate : NSObject <UIApplicationDelegate>{
    DGController* controller;
    UITabBarController *tabBarController;
    id <TabBarHidder> delegate;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet DGController* controller;

@end
