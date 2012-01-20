//
//  PlayerPhotoViewController.h
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DGPlayer.h"
#import <UIKit/UIKit.h>

@interface PlayerPhotoViewController : UIViewController

<UIImagePickerControllerDelegate, UIActionSheetDelegate>{
    @private
    UIImageView *picture;
}

@end
