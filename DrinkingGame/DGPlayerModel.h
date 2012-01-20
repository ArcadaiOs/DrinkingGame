//
//  DGPlayerModel.h
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface DGPlayerModel : NSObject{
    
    NSManagedObjectContext *managedObjectContext;  
    NSMutableArray *playerArray;   
    
}   

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;   
@property (nonatomic, retain) NSMutableArray *playerArray;   
- (void) fetchRecords;  
@end
