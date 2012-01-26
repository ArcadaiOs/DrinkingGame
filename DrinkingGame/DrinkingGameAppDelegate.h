//
//  DrinkingGameAppDelegate.h
//  DrinkingGame
//
//  Created by student on 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
// Pyry o Gögä e bäst <3

#import <UIKit/UIKit.h>


@class PlayerPhotoViewController;
@class DrinkingGameViewController;

@interface DrinkingGameAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PlayerPhotoViewController *viewController;


@end
