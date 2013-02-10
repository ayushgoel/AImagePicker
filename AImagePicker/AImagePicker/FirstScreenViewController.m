//
//  firstControllerViewController.m
//  AImagePicker
//
//  Created by Ayush on 10/02/13.
//  Copyright (c) 2013 Ayush. All rights reserved.
//

#import "FirstScreenViewController.h"

#define TOOLBAR_HEIGHT 30.0

@interface FirstScreenViewController () <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIToolbar *toolBar;
@end

@implementation FirstScreenViewController
@synthesize imageView = imageView_;
@synthesize toolBar = toolBar_;

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.imageView = [[[UIImageView alloc] initWithFrame:self.view.bounds] autorelease];
  self.toolBar = [[[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - TOOLBAR_HEIGHT, self.view.bounds.size.width, TOOLBAR_HEIGHT)] autorelease];
  self.toolBar.barStyle = UIBarStyleBlackTranslucent;

  UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(buttonPressed)];
  [self.toolBar setItems:@[button] animated:NO];

  [self.view addSubview:self.imageView];
  [self.view addSubview:self.toolBar];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)showImagePickerControllerWithSource:(UIImagePickerControllerSourceType)sourceType {
  if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
    UIImagePickerController *imagePickerController = [[[UIImagePickerController alloc] init] autorelease];
    imagePickerController.delegate = self;
    [self presentModalViewController:imagePickerController animated:YES];
  }
}

#pragma UIInteractions
- (void)buttonPressed {
  UIActionSheet *pickSource = [[UIActionSheet alloc] initWithTitle:nil
                                                          delegate:self
                                                 cancelButtonTitle:@"Cancel"
                                            destructiveButtonTitle:nil
                                                 otherButtonTitles:@"Open Camera", @"Open Library", nil];
  pickSource.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
  [pickSource showInView:self.view];
}

#pragma UIActionSheetDelegate
// Cancel not handled, as no UI interaction required for it here.
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  if (buttonIndex == 0) {
    [self showImagePickerControllerWithSource:UIImagePickerControllerSourceTypeCamera];
  } else if (buttonIndex == 1) {
    [self showImagePickerControllerWithSource:UIImagePickerControllerSourceTypePhotoLibrary];
  }
}

@end
