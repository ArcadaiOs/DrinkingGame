//
//  DrinkingGameAppDelegate.h
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//LOGIKSPEL Viktor

#import <UIKit/UIKit.h>

@class DrinkingGameViewController;

@interface DrinkingGameAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet DrinkingGameViewController *viewController;

@end
