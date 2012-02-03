//
//  PhotoC.m
//  DrinkingGame
//
//  Created by student on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotoCameraController.h"

@implementation PhotoCameraController

@synthesize image = image_;
@synthesize player=player_;
@synthesize photoPicker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (player_.image != nil) {
        self.image.image = [UIImage imageWithData:player_.image];
    }
}
-(IBAction)takePictureButtonPressed{
    NSLog(@"%@",@"Taking a picture...");
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        NSLog(@"%@", @"This decive has a camera. Asking user what they want to use.");
        UIActionSheet *photoSourceSheet = [[UIActionSheet alloc] initWithTitle:@"Select  picture" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take new photo", @"Choose existing Photo", nil];
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

-(void) imagePickerController: (UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    player_.image = UIImagePNGRepresentation([info objectForKey:UIImagePickerControllerEditedImage]);
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


@end
