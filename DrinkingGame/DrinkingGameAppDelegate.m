//
//  DrinkingGameAppDelegate.m
//  DrinkingGame
//
//  Created by student don 1/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
// hello woedlllll
#import "DrinkingGameAppDelegate.h"

#import "DrinkingGameViewController.h"

@implementation DrinkingGameAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;



-(void) createEditableCopyOfDatabaseIfNeeded {
    
    //First test for existence - we dont want to wipe out a usres db 
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsDir = [self applicationDocumentsDirectory];
    NSURL *writableDBPath = [documentsDir URLByAppendingPathComponent:@"DrinkingGame.sqlite"];
    
    BOOL dbExists = [fileManager fileExistsAtPath:[writableDBPath path]];
    if (!dbExists) {
        
        //the writable database does not exist, so copy the default to the appropriate location.
        NSURL *defaultDBPath = [[NSBundle mainBundle] URLForResource:@"DrinkingGame" withExtension:@"sqlite"];
        
        NSError *error;
        BOOL success = [fileManager copyItemAtURL:defaultDBPath toURL:writableDBPath error: &error];
        if (!success) {
            NSAssert1(0, @"Failed to create writable database file with message lol `%@´.",[error localizedDescription]);
        }                               
    }
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self createEditableCopyOfDatabaseIfNeeded ]; 
   // self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}
// Yellow bitchees
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}









- (void)dealloc
{
    [_window release];
    [_viewController release];
    [__managedObjectContext release];
    [__persistentStoreCoordinator release];
    [super dealloc];
    
}

@end
