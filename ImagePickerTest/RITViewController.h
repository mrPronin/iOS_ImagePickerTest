//
//  RITViewController.h
//  ImagePickerTest
//
//  Created by Aleksandr Pronin on 28.04.14.
//  Copyright (c) 2014 Aleksandr Pronin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface RITViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *takePictureButton;

@property (strong, nonatomic) MPMoviePlayerController *moviePlayercontroller;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSURL *movieURL;
@property (strong, nonatomic) NSString *lastChosenMediaType;
@property (assign, nonatomic) CGRect imageFrame;

- (IBAction)shootPictureOrVideo:(UIButton *)sender;
- (IBAction)selectExistingPictureOrVideo:(UIButton *)sender;

@end
