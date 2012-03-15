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
//@protocol CloseScreen <NSObject>
//-(void) closeScreen;
//@end

@interface DGPlayerStatView : UITableViewController <UITableViewDelegate,UITableViewDataSource>{
    IBOutlet UITableView* table;
    DGController* controller;
//    id < CloseScreen > delegate;
}
@property(nonatomic, assign) DGController* controller;
-(id) init;
-(IBAction) swipeLeft:(UIGestureRecognizer*)sender;
@end
