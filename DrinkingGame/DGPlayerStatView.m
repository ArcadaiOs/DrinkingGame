//
//  DGPlayerStatView.m
//  DrinkingGame
//
//  Created by student on 3/1/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DGPlayerStatView.h"
@implementation DGPlayerStatView
@synthesize controller;

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
- (id)init
{
    //self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self = [super init];
    
    if (self) {
//        [self setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Players" image:[UIImage imageNamed:@"iconPlayerA.png"] tag:1]];
        controller = [DGController sharedInstance];
        UITapGestureRecognizer *swipeLeft = [[UITapGestureRecognizer alloc]
                                                    initWithTarget:self action:@selector(handleSwipeLeft:)];
        [self.view addGestureRecognizer:swipeLeft];
        [swipeLeft release];
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
    return [[[DGController sharedInstance] players] count];
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
    [cell setPlayer:[[[DGController sharedInstance] players] objectAtIndex:row]];
    return cell;
    
}

-(IBAction)swipeLeft:(UIGestureRecognizer*)sender{
    NSLog(@"Swipe");
    UIView* main = [self.view superview];
    [self.view removeFromSuperview];
    DGController*gameController = [DGController sharedInstance];
    [main addSubview:[gameController.mainViewController debugView ]]; 
}
@end
