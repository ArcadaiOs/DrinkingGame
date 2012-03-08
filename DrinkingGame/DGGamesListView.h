//
//  DGGamesListView.h
//  DrinkingGame
//
//  Created by student on 3/8/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGGameListCell.h"
#import "DGController.h"

@interface DGGamesListView : UITableViewController<UITableViewDelegate,UITableViewDataSource>{
    DGController * controller;
    IBOutlet UITableView *table;
}
@property(nonatomic, retain) DGController* controller;
- (id)initWithController: (DGController*) controllerIn;

@end
