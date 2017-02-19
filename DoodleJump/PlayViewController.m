//
//  PlayViewController.m
//  DoodleJump
//
//  Created by Sagar Mangulkar on 2/17/17.
//  Copyright © 2017 Sagar Mangulkar. All rights reserved.
//

#import "PlayViewController.h"

@implementation PlayViewController


- (void)viewDidLoad{
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(jump:)
                                   userInfo:nil
                                    repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:self
                                   selector:@selector(moveLeftRight:)
                                   userInfo:nil
                                    repeats:YES];
}

-(void)jump:timer{
    //simple jump
    CGRect frameDoodler = self.imageDoodler.frame;
    int widthDoodler = frameDoodler.size.width;
    int heightDoodler = frameDoodler.size.height;
    CGRect framePlatformSimpleRed1 = self.platformSimpleRed1.frame;
    CGRect framePlatformSimpleRed2 = self.platformSimpleRed2.frame;
    CGRect framePlatformSimpleRed3 = self.platformSimpleRed3.frame;
    CGRect framePlatformSimpleRed4 = self.platformSimpleRed4.frame;
    CGRect framePlatformSimpleRed5 = self.platformSimpleRed5.frame;
    
    int widthPlatform = framePlatformSimpleRed1.size.width;
    int heightPlatform = framePlatformSimpleRed1.size.height;
    [UIView animateWithDuration:1.0 animations:^{
        CGRect frameDoodler = self.imageDoodler.frame;
        if (frameDoodler.origin.y > 0) {
            frameDoodler.origin.y -= 200;
        }
        if (frameDoodler.origin.x >= 0 && frameDoodler.origin.x <= 327) {
            frameDoodler.origin.x = _slider.value * 327;
        }
   //     NSLog(@"Slider value: @%f, Doodler value: @%f", _slider.value, _slider.value * 327);
        self.imageDoodler.frame = frameDoodler;
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1.0 animations:^{
                             CGRect frameDoodler = self.imageDoodler.frame;
            //                 CGRect framePlatformSimpleRed1 = self.platformSimplwRed1.frame;

                             if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed1.origin.x) &&
                                 (frameDoodler.origin.x < framePlatformSimpleRed1.origin.x + widthPlatform - 10) &&
                                 (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed1.origin.y)) {
                             frameDoodler.origin.y = framePlatformSimpleRed1.origin.y - 55;
                             }
                             else if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed2.origin.x) &&
                                 (frameDoodler.origin.x < framePlatformSimpleRed2.origin.x + widthPlatform - 10) &&
                                      (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed2.origin.y)) {
                                 frameDoodler.origin.y = framePlatformSimpleRed2.origin.y - 55;
                             }
                             else if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed3.origin.x) &&
                                 (frameDoodler.origin.x < framePlatformSimpleRed3.origin.x + widthPlatform - 10) &&
                                      (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed3.origin.y)) {
                                 frameDoodler.origin.y = framePlatformSimpleRed3.origin.y - 55;
                             }
                             else if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed4.origin.x) &&
                                 (frameDoodler.origin.x < framePlatformSimpleRed4.origin.x + widthPlatform - 10) &&
                                      (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed4.origin.y)) {
                                 frameDoodler.origin.y = framePlatformSimpleRed4.origin.y - 55;
                             }
                             else if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed5.origin.x) &&
                                 (frameDoodler.origin.x < framePlatformSimpleRed5.origin.x + widthPlatform - 10) &&
                                      (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed5.origin.y)) {
                                 frameDoodler.origin.y = framePlatformSimpleRed5.origin.y - 55;
                                 NSLog(@"Platform5- X: @%f, Y: @%f", frameDoodler.origin.x + heightDoodler, frameDoodler.origin.y);
                             }
                             else{
                                 while (frameDoodler.origin.y < 575) {
                                     if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed1.origin.x) &&
                                         (frameDoodler.origin.x < framePlatformSimpleRed1.origin.x + widthPlatform - 10) &&
                                         (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed1.origin.y)) {
                                         frameDoodler.origin.y = framePlatformSimpleRed1.origin.y - 55;
                                     }
                                     else if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed2.origin.x) &&
                                              (frameDoodler.origin.x < framePlatformSimpleRed2.origin.x + widthPlatform - 10) &&
                                              (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed2.origin.y)) {
                                         frameDoodler.origin.y = framePlatformSimpleRed2.origin.y - 55;
                                     }
                                     else if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed3.origin.x) &&
                                              (frameDoodler.origin.x < framePlatformSimpleRed3.origin.x + widthPlatform - 10) &&
                                              (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed3.origin.y)) {
                                         frameDoodler.origin.y = framePlatformSimpleRed3.origin.y - 55;
                                     }
                                     else if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed4.origin.x) &&
                                              (frameDoodler.origin.x < framePlatformSimpleRed4.origin.x + widthPlatform - 10) &&
                                              (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed4.origin.y)) {
                                         frameDoodler.origin.y = framePlatformSimpleRed4.origin.y - 55;
                                     }
                                     else if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed5.origin.x) &&
                                              (frameDoodler.origin.x < framePlatformSimpleRed5.origin.x + widthPlatform - 10) &&
                                              (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed5.origin.y)) {
                                         frameDoodler.origin.y = framePlatformSimpleRed5.origin.y - 55;
                                         NSLog(@"Platform5- X: @%f, Y: @%f", frameDoodler.origin.x + heightDoodler, frameDoodler.origin.y);
                                     }
                                     else{
                                         frameDoodler.origin.y += 300;
                                         NSLog(@"Falling- X: @%f, Y: @%f", frameDoodler.origin.x + heightDoodler, frameDoodler.origin.y);
                                     }
                                 }
                             }
                             self.imageDoodler.frame = frameDoodler;
                         }];
                     }
     ];
}

-(void)moveLeftRight:timer{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect imageFrame = self.imageDoodler.frame;
        if (imageFrame.origin.x >= 0 && imageFrame.origin.x <= 327) {
            imageFrame.origin.x = _slider.value * 327;
        }
//        NSLog(@"MoveRightLeft- Slider value: @%f, Doodler value: @%f", _slider.value, _slider.value * 327);
        self.imageDoodler.frame = imageFrame;
    }];
}


@end
