//
//  PlayerPhotoViewController.m
//  DrinkingGame
//
//  Created by student on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlayerPhotoViewController.h"


@implementation PlayerPhotoViewController

@synthesize pictureView = _pictureView;


//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a selfview.
    [self didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)doneButtonPressed{
    [self dismissModalViewControllerAnimated:YES];
    
}
- (void) viewWillAppear:(BOOL)animated{
    [self viewWillAppear:animated];
//    if (dgplayer_.picture != nil) {
//        self.picture.image = [UIImage imageWithData:dgplayer_.picture];
//    }
    
}

-(IBAction)takePictureButtonPressed{
    NSLog(@"%@",@"Taking a picture...");
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        NSLog(@"%@", @"This decive has a camera. Asking user what they want to use.");
        UIActionSheet *photoSourceSheet = [[UIActionSheet alloc] initWithTitle:@"Select dgplayer picture" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take new photo", @"Choose existing Photo", nil];
        [photoSourceSheet showInView:self.view];
        [photoSourceSheet release];
        
    }
    else { // no camera just use the library
        
        
        
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = self;
        picker.allowsEditing = YES;
        [self presentModalViewController: picker animated:YES];
        
    }
}

#pragma mark - UIImagePickerControllerDelegate methods

-(void) imagePickerController: (UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    self.pictureView = UIImagePNGRepresentation([info objectForKey:UIImagePickerControllerEditedImage]);
    [self dismissModalViewControllerAnimated:YES];
    [picker release];
}
-(void) imagePickerControllerDidCancel: (UIImagePickerController *)picker {
    [self dismissModalViewControllerAnimated:YES];
    [picker release];
}

-(void) actionSheet:(UIActionSheet *) actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex ==actionSheet.cancelButtonIndex) {
        NSLog(@"%@", @"The user cancelled adding an image.");
        return;
        
    }
    UIImagePickerController *picker =[[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    switch (buttonIndex) {
        case 0:
            NSLog(@"%@", @"User wants to take a new picture.");
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            break;
            
        case 1:
            NSLog(@"%@", @"User wants to use an existing picture.");
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            break;
            
    }
    [self presentModalViewController:picker animated:YES];
}

-(void)dealloc
{
    [_pictureView release];
    [self dealloc];
    
}


@end