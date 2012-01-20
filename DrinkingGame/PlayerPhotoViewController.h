//
//  PlayerPhotoViewController.h
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGPlayerDB.h"

@interface PlayerPhotoViewController : UIViewController
<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>{
@private
    UIImage *picture_;
    DGPlayerDB *dgplayer;
}

@property (nonatomic, retain) IBOutlet UIImage *picture;
@property (nonatomic, retain) IBOutlet DGPlayerDB *dgplayer;

- (IBAction)doneButtonPressed;
-(IBAction)takePictureButtonPressed;


@end