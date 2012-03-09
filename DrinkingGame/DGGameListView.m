//
//  DGPlayerStatView.m
//  DrinkingGame
//
//  Created by student on 3/1/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGGameListView.h"
@implementation DGGameListView
@synthesize controller;

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
- (id)initWithController: (DGController*) controllerIn
{
    //self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self = [super init];
    
    if (self) {
        [self setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Games" image:[UIImage imageNamed:@"iconPlayerA.png"] tag:2]];
        controller = controllerIn;
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
    return [[[DGController sharedInstance] games] count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DGGameListCell *cell = (DGGameListCell*)[tableView dequeueReusableCellWithIdentifier:@"SimpleTableIdentifier"];
    if (cell == nil) {
        NSBundle *b = [NSBundle mainBundle];
        NSArray *nibObjects = [b loadNibNamed:@"DGGameListCell" owner:self options:nil];
        for(id curObj in nibObjects){
            if([curObj isKindOfClass:[DGGameListCell class]]){
                cell = (DGGameListCell*)curObj;
            }
        }
    }
    
    NSUInteger row = [indexPath row];
    [cell setGame:[[[DGController sharedInstance] games] objectAtIndex:row]];
    return cell;
    
}
@end
