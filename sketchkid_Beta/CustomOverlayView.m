//
//  CustomOverlayView.m
//  kidsArt
//
//  Created by Andrea Terzani on 09/08/12.
//  Copyright (c) 2012 Andrea Terzani. All rights reserved.
//

#import "CustomOverlayView.h"

@implementation CustomOverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Add the bottom bar
        UIImage *image = [UIImage imageNamed:@"toolBackHome"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(0, 380, 320, 100);
        [self addSubview:imageView];
        
        
        // Add the capture button
        self.pictureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.pictureButton.frame = CGRectMake(94, 385, 130, 100);
        UIImage *buttonImageNormal = [UIImage imageNamed:@"cameraIcon.png"];
        [self.pictureButton setImage:buttonImageNormal forState:UIControlStateNormal];
        [self.pictureButton setImage:buttonImageNormal forState:UIControlStateDisabled];
        [self.pictureButton addTarget:self action:@selector(takePicture:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.pictureButton];
        
        
        
        UIButton *cancelButton=[UIButton buttonWithType:UIButtonTypeCustom];
        cancelButton.frame=CGRectMake(10, 385, 130, 100);
        UIImage *buttonImageCancel=[UIImage imageNamed:@"close_x.png"];
        [cancelButton setImage:buttonImageCancel forState:UIControlStateNormal];
        [cancelButton setImage:buttonImageCancel forState:UIControlStateDisabled];
        [cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancelButton];
        
        UIButton *doneButton=[UIButton buttonWithType:UIButtonTypeCustom];
        doneButton.frame=CGRectMake(190, 385, 130, 100);
        UIImage *doneButtonImage=[UIImage imageNamed:@"close_x.png"];
        [doneButton setImage:doneButtonImage forState:UIControlStateNormal];
        [doneButton setImage:doneButtonImage forState:UIControlStateDisabled];
        [doneButton addTarget:self action:@selector(doneButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:doneButton];
        
        
        //TODO: L' indicatore non è visibile! Da correggere...
        
        self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        self.spinner.alpha = 1.0;
        self.spinner.center = CGPointMake(160, 240);
        self.spinner.hidesWhenStopped = YES;

        [self addSubview:self.spinner];


    }
    return self;
}

-(void)startSpinner{
    [self.spinner startAnimating];
    
    
}

-(void)stopSpinner{

    [self.spinner stopAnimating];
    
}
-(void)doneButtonAction:(id)sender
{

    self.pictureButton.enabled=FALSE;
    [self.delegate CustomOverlaydidDone];

}

-(void)cancelButtonAction:(id)sender
{

    [self.delegate CustomOverlaydidCancel];

}

- (void)takePicture:(id)sender
{
    [self.delegate CustomOverlaytakePicture];
}


@end
