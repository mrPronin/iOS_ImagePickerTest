//
//  RITViewController.m
//  ImagePickerTest
//
//  Created by Aleksandr Pronin on 28.04.14.
//  Copyright (c) 2014 Aleksandr Pronin. All rights reserved.
//

#import "RITViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>

@interface RITViewController ()

static UIImage *shrinkImage(UIImage *original, CGSize size);
- (void) updateDisplay;
- (void) getMediaFromSource:(UIImagePickerControllerSourceType) sourceType;

@end

@implementation RITViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        self.takePictureButton.hidden = YES;
    }
    self.imageFrame = self.imageView.frame;
}

- (void) viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [self updateDisplay];
}

- (void) dealloc {
    
    self.moviePlayercontroller = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)shootPictureOrVideo:(UIButton *)sender {
    
    [self getMediaFromSource:UIImagePickerControllerSourceTypeCamera];
}

- (IBAction)selectExistingPictureOrVideo:(UIButton *)sender {
    
    [self getMediaFromSource:UIImagePickerControllerSourceTypePhotoLibrary];
}

#pragma mark - UIImagePickerController delegate mathods

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    self.lastChosenMediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([self.lastChosenMediaType isEqualToString:(NSString*)kUTTypeImage]) {
        UIImage *chosenImage = [info objectForKey:UIImagePickerControllerEditedImage];
        UIImage *shrunkedImage = shrunkedImage(chosenImage, self.imageFrame.size);
        self.image = shrunkedImage;
    } else {
        
    }
}

@end
