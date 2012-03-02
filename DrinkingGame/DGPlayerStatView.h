//
//  DGPlayerStatView.h
//  DrinkingGame
//
//  Created by student on 3/1/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DGPlayerStatCell.h"
@interface DGPlayerStatView : UIViewController
<UITableViewDelegate,UITableViewDataSource>{
    IBOutlet UITableView* table;
    NSMutableArray* players;
}
@property(nonatomic, retain) NSMutableArray* players;
- (id)initWithPlayers: (NSMutableArray*) playersIn;
@end
