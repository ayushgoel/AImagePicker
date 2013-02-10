//
//  ImagePreViewController.m
//  AImagePicker
//
//  Created by Ayush on 10/02/13.
//  Copyright (c) 2013 Ayush. All rights reserved.
//

#import "ImagePreViewController.h"

@interface ImagePreViewController ()

@property (nonatomic, retain) UIImageView *imageView;

@end

@implementation ImagePreViewController

@synthesize imageView = imageView_;
@synthesize delegate = delegate_;
@synthesize image = image_;

- (void)setImage:(UIImage *)image {
  image_ = image;
  self.imageView.image = image_;
}

-(id)init {
  self = [super init];
  if (self) {
    self.imageView = [[[UIImageView alloc] initWithFrame:self.view.bounds] autorelease];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageView];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Choose"
                                                                               style:UIBarButtonItemStyleDone
                                                                              target:self
                                                                              action:@selector(chooseButtonPressed)] autorelease];
    self.title = @"Preview";
  }
  return self;
}

- (void)viewDidUnload {
  self.image = nil;
  self.imageView = nil;
  [super viewDidUnload];
}

- (void)chooseButtonPressed {
  [self.delegate useSelectedImage:self.image];
}

@end
