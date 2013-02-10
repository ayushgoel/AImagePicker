//
//  ImagePreViewController.h
//  AImagePicker
//
//  Created by Ayush on 10/02/13.
//  Copyright (c) 2013 Ayush. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImagePreViewControllerDelegate <NSObject>

- (void)useSelectedImage:(UIImage *)image;

@end

@interface ImagePreViewController : UIViewController

@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) id<ImagePreViewControllerDelegate> delegate;

@end
