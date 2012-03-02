//
//  DGPlayerStatView.m
//  DrinkingGame
//
//  Created by student on 3/1/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGPlayerStatView.h"
@implementation DGPlayerStatView
@synthesize players;

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
- (id)initWithPlayers: (NSMutableArray*) playersIn
{
    //self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self = [super init];
    
    if (self) {
        players = playersIn;
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Table View Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.players count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DGPlayerStatCell *cell = (DGPlayerStatCell*)[tableView dequeueReusableCellWithIdentifier:@"SimpleTableIdentifier"];
    if (cell == nil) {
        NSBundle*b = [NSBundle mainBundle];
        NSArray* nibObjects = [b loadNibNamed:@"DGPlayerStatCell" owner:self options:nil];
        for(id curObj in nibObjects){
            if([curObj isKindOfClass:[DGPlayerStatCell class]]){
                cell = (DGPlayerStatCell*)curObj;
            }
        }
    }
    
    NSUInteger row = [indexPath row];
    [cell setPlayer:[players objectAtIndex:row]];
    return cell;
    
}
@end
