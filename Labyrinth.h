//
//  Labyrinth.h
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Labyrinth : UIViewController {

    IBOutlet UIImageView *image1;
    IBOutlet UIImageView *image2;
    UILabel *stopWatchLabel;
    IBOutlet UIButton *button;
}




@property (nonatomic, retain) IBOutlet UILabel *stopWatchLabel;

- (IBAction)onStartPressed:(id)sender;
- (IBAction)onStopPressed:(id)sender;


@property (nonatomic, retain) UIImageView *image1;
@property (nonatomic, retain) UIImageView *image2;
-(void)collision;
@end
