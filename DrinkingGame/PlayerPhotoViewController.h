//
//  PlayerPhotoViewController.h
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerPhotoViewController : UIViewController

<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>
{
// @private
   IBOutlet UIImageView *_pictureView;
}

@property (nonatomic, retain) IBOutlet UIImageView *pictureView;

- (IBAction)doneButtonPressed;
- (IBAction)takePictureButtonPressed;


@end