//
//  PlayViewController.m
//  DoodleJump
//
//  Created by Sagar Mangulkar on 2/17/17.
//  Copyright © 2017 Sagar Mangulkar. All rights reserved.
//

#import "PlayViewController.h"

@implementation PlayViewController

- (IBAction)buttonTest:(id)sender {
    int jumpedPositionY;
    [UIView beginAnimations:NULL context:NULL];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationDuration:1];
    CGRect imageFrame = _imageDoodler.frame;
//    jumpedPositionY = imageFrame.origin.y;
    imageFrame.origin.y -= 200;
    NSLog(@"%f",imageFrame.origin.y);

    _imageDoodler.frame = imageFrame;
    [UIView commitAnimations];
//    imageFrame = _imageDoodler.frame;
//    imageFrame.origin.y += 200;
//    _imageDoodler.frame = imageFrame;
    NSLog(@"%f",imageFrame.origin.y);
    
    
//    [UIView animateWithDuration:2.0 animations:^{ _imageDoodler.center = CGPointMake(100, 150);}];
//       [UIView setAnimationRepeatAutoreverses:YES];
//
//    [UIView commitAnimations];
//    _imageDoodler.center = CGPointMake(200, 100);
}

@end
