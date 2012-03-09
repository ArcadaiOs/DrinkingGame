//
//  playerStatView.h
//  DrinkingGame
//
//  Created by student on 3/1/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface playerStatView : UIViewController
<UITableViewDelegate,UITableViewDataSource>{
    NSArray *listData;
}
@property(nonatomic, retain) NSArray *listData;
@end
