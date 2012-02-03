//
//  PhotoC.h
//  DrinkingGame
//
//  Created by student on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGGame.h"
#import "DGRandomShot.h"
#import "DGController.h"
#import "DGGameSimonSays.h"
#import "DGSteadyHands.h"
#import "DGViewPlayer.h"

@interface PhotoCameraController : UIViewController

<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>{
    
    DGGame *currentCame;
    DGController* controller;
    DGPlayer *player;
    UIView * photoPicker;
    
}
@property (nonatomic, retain) IBOutlet UIImageView *image;
//@property (nonatomic, retain) DGController* controller;
@property (nonatomic, retain) IBOutlet DGPlayer *player;
@property (nonatomic, retain) IBOutlet UIView * photoPicker;

//-(IBAction) showPlayer:(id)sender;
//-(void) gameEndedWithScores:(NSString*) scores;
//-(IBAction) launchTestGame:(id)sender;
//-(IBAction) launchSimon:(id)sender;
//-(IBAction) launchSteadyHands:(id)sender;
-(IBAction)takePictureButtonPressed;
@end
