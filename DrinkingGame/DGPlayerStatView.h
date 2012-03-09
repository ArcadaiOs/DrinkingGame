//
//  DGPlayerStatView.h
//  DrinkingGame
//
//  Created by student on 3/1/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGPlayerStatCell.h"
#import "DGPlayer.h"
#import "DGController.h"
@protocol CloseScreen <NSObject>
-(void) closeScreen;
@end

@interface DGPlayerStatView : UIViewController <UITableViewDelegate,UITableViewDataSource>{
    IBOutlet UITableView* table;
    DGController* controller;
    id < CloseScreen > delegate;
}
@property(nonatomic, retain) DGController* controller;
- (id)initWithController: (DGController*) controllerIn;
-(IBAction) back:(id)sender;
@end
