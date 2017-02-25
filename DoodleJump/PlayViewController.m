//
//  PlayViewController.m
//  DoodleJump
//
//  Created by Sagar Mangulkar on 2/17/17.
//  Copyright © 2017 Sagar Mangulkar. All rights reserved.
//

#import "PlayViewController.h"

NSString *maxScore = @"0";

//int counterForHidingDoodler = 0;
int counterLevel = 0;
@implementation PlayViewController
//score handler
BOOL isIncrementablePlatform1 = YES;
BOOL isIncrementablePlatform2 = YES;
BOOL isIncrementablePlatform3 = YES;
BOOL isIncrementablePlatform4 = YES;
BOOL isIncrementablePlatform5 = YES;

int movingDistancePlatform2 = 5;
int movingDistancePlatform3 = 3;

//pause and resume handler
BOOL isPaused = NO;

- (void)viewDidLoad{
    
    [_labelGameOver setHidden:YES];
    [_buttonPlayAgain setHidden:YES];
    [_labelWin setHidden:YES];
    [_labelYourScore setHidden:YES];
    [_labelDisplayScore setHidden:YES];
    [_buttonResume setHidden:YES];
    counterLevel = 0;
    //score handler
    isIncrementablePlatform1 = YES;
    isIncrementablePlatform2 = YES;
    isIncrementablePlatform3 = YES;
    isIncrementablePlatform4 = YES;
    isIncrementablePlatform5 = YES;
    
    
    //max score handler
    _labelMaxScore.text = maxScore;
    
    //score handling
    _labelScore.text = @"0";
    
    //pause and resume handler
    isPaused = NO;

    [NSTimer scheduledTimerWithTimeInterval:1.5
                                     target:self
                                   selector:@selector(jump:)
                                   userInfo:nil
                                    repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:self
                                   selector:@selector(moveLeftRight:)
                                   userInfo:nil
                                    repeats:YES];
    //    [NSTimer scheduledTimerWithTimeInterval:15.0
    //                                     target:self
    //                                   selector:@selector(score:)
    //                                   userInfo:nil
    //                                    repeats:YES];
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(platformMove:)
                                   userInfo:nil
                                    repeats:YES];
    
}

-(void)platformMove:timer{
    if (!isPaused) {
    if ([_labelGameOver isHidden] && [_labelWin isHidden]) {
                if (counterLevel > 0) {
        [UIView animateWithDuration:0.005 animations:^{
            CGRect framePlatform = self.platformSimpleRed2.frame;
            if (framePlatform.origin.x > 300) {
                if (counterLevel == 0) {
                    movingDistancePlatform2 = -1;
                }
                else if(counterLevel > 0){
                    movingDistancePlatform2 = -5;
                }
            }
            else if (framePlatform.origin.x < 10){
                if (counterLevel == 0) {
                    movingDistancePlatform2 = 1;
                }
                else if(counterLevel > 0){
                    movingDistancePlatform2 = 5;
                }
            }
            framePlatform.origin.x = framePlatform.origin.x + movingDistancePlatform2;
            self.platformSimpleRed2.frame = framePlatform;
        }
         ];
                }
        [UIView animateWithDuration:0.005 animations:^{
            CGRect framePlatform = self.platformSimpleRed3.frame;
            if (framePlatform.origin.x > 300) {
                if (counterLevel == 0) {
                    movingDistancePlatform3 = -1;
                }
                else if(counterLevel > 0){
                    movingDistancePlatform3 = -3;
                }
            }
            else if (framePlatform.origin.x < 10){
                if (counterLevel == 0) {
                    movingDistancePlatform3 = 3;
                }
                else if(counterLevel > 0){
                    movingDistancePlatform3 = 3;
                }
            }
            framePlatform.origin.x = framePlatform.origin.x + movingDistancePlatform3;
            self.platformSimpleRed3.frame = framePlatform;
        }
         ];
        
    }
    }
}

//-(void)score:timer{
//    //score handler
//       _labelScore.text = [NSString stringWithFormat:@"%ld", (long)counterLevel];
//}

-(void)jump:timer{
        if (!isPaused) {
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
    //    int heightPlatform = framePlatformSimpleRed1.size.height;
    
    
    // NSLog(@"Doodler Y: @%f",frameDoodler.origin.y);
    
    //-----------Max score logic--------------
    if ([_labelScore.text integerValue] > [maxScore integerValue]) {
        maxScore = _labelScore.text;
        _labelMaxScore.text = maxScore;
    }
    
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:nil animations:^{
        CGRect frameDoodler = self.imageDoodler.frame;
        if (frameDoodler.origin.y > 0) {
            if ([_labelGameOver isHidden]) {
                [_imageDoodler setHidden:NO];
            }
            [_platformSimpleRed5 setHidden:NO];
            [_platformSimpleRed4 setHidden:NO];
            [_platformSimpleRed3 setHidden:NO];
            [_platformSimpleRed2 setHidden:NO];
            [_platformSimpleRed1 setHidden:NO];
            
            
            
            //check for Game Over when Doodler falls
            if (frameDoodler.origin.y > 607) {
                [_labelGameOver setHidden:NO];
                [_buttonPlayAgain setHidden:NO];
                [_imageDoodler setHidden:YES];
                [_labelYourScore setHidden:NO];
                _labelDisplayScore.text = _labelScore.text;
                [_labelDisplayScore setHidden:NO];
                [_buttonResume setHidden:YES];
                [_buttonPause setHidden:YES];
                
                //                //score handler
                //                isIncrementablePlatform1 = NO;
                //                isIncrementablePlatform2 = NO;
                //                isIncrementablePlatform3 = NO;
                //                isIncrementablePlatform4 = NO;
                //                isIncrementablePlatform5 = NO;
            }
            
            
            frameDoodler.origin.y -= 200;
        }
        //screen level change
        else if(frameDoodler.origin.y < 0){
            counterLevel++;
            //moving platform handler
            movingDistancePlatform2 = -5;
            movingDistancePlatform3 = 3;
            //score handler
            isIncrementablePlatform1 = YES;
            isIncrementablePlatform2 = YES;
            isIncrementablePlatform3 = YES;
            isIncrementablePlatform4 = YES;
            isIncrementablePlatform5 = YES;
            //            _labelScore.text = [NSString stringWithFormat:@"%ld", (long)counterLevel*10];
            frameDoodler.origin.y = 607;
            [_imageDoodler setHidden:YES];
            [UIView animateWithDuration:0 animations:^{
                [_platformSimpleRed5 setHidden:YES];
                [_platformSimpleRed4 setHidden:YES];
                [_platformSimpleRed3 setHidden:YES];
                [_platformSimpleRed2 setHidden:YES];
                [_platformSimpleRed1 setHidden:YES];
                
                CGRect framePlatformSimpleRed4 = self.platformSimpleRed4.frame;
                CGRect framePlatformSimpleRed3 = self.platformSimpleRed3.frame;
                CGRect framePlatformSimpleRed2 = self.platformSimpleRed2.frame;
                CGRect framePlatformSimpleRed1 = self.platformSimpleRed1.frame;
                
                //winning check
                if (counterLevel >= 3) {
                    [_labelWin setHidden:NO];
                    [_buttonPlayAgain setHidden:NO];
                    [_labelYourScore setHidden:NO];
                    _labelDisplayScore.text = _labelScore.text;
                    [_labelDisplayScore setHidden:NO];
                    [_buttonResume setHidden:YES];
                    [_buttonPause setHidden:YES];
                    
                    //score handler
                    isIncrementablePlatform1 = NO;
                    isIncrementablePlatform2 = NO;
                    isIncrementablePlatform3 = NO;
                    isIncrementablePlatform4 = NO;
                    isIncrementablePlatform5 = NO;
                    
                    framePlatformSimpleRed4.origin.y = 590;
                    framePlatformSimpleRed3.origin.y = 590;
                    framePlatformSimpleRed2.origin.y = 590;
                    framePlatformSimpleRed1.origin.y = 590;
                    
                    framePlatformSimpleRed4.origin.x = 0;
                    framePlatformSimpleRed3.origin.x = 75;
                    framePlatformSimpleRed2.origin.x = 300;
                    framePlatformSimpleRed1.origin.x = 225;
                }
                else{
                    
                    if (framePlatformSimpleRed4.origin.x > 0 || framePlatformSimpleRed4.origin.x < (327 - widthPlatform)) {
                        framePlatformSimpleRed4.origin.x = arc4random_uniform(327 - widthPlatform);
                    }
                    if (framePlatformSimpleRed3.origin.x > 0 || framePlatformSimpleRed3.origin.x < (327 - widthPlatform)) {
                        framePlatformSimpleRed3.origin.x = arc4random_uniform(327 - widthPlatform);
                    }
                    if (framePlatformSimpleRed2.origin.x > 0 || framePlatformSimpleRed2.origin.x < (327 - widthPlatform)) {
                        framePlatformSimpleRed2.origin.x = arc4random_uniform(327 - widthPlatform);
                    }
                    if (framePlatformSimpleRed1.origin.x > 0 || framePlatformSimpleRed1.origin.x < (327 - widthPlatform)) {
                        framePlatformSimpleRed1.origin.x = arc4random_uniform(327 - widthPlatform);
                    }
                }
                _platformSimpleRed4.frame = framePlatformSimpleRed4;
                _platformSimpleRed3.frame = framePlatformSimpleRed3;
                _platformSimpleRed2.frame = framePlatformSimpleRed2;
                _platformSimpleRed1.frame = framePlatformSimpleRed1;
                
            }];
            //        _labelScore.text = [NSString stringWithFormat:@"%ld", (long)([_labelScore.text integerValue] + 10)];
        }
        //        if (frameDoodler.origin.x >= 0 && frameDoodler.origin.x <= 327) {
        //            frameDoodler.origin.x = _slider.value * 327;
        //        }
        //     NSLog(@"Slider value: @%f, Doodler value: @%f", _slider.value, _slider.value * 327);
        self.imageDoodler.frame = frameDoodler;
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.5 animations:^{
                             CGRect frameDoodler = self.imageDoodler.frame;
                             //                 CGRect framePlatformSimpleRed1 = self.platformSimplwRed1.frame;
                             
                             if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed1.origin.x) &&
                                 (frameDoodler.origin.x < framePlatformSimpleRed1.origin.x + widthPlatform - 10) &&
                                 (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed1.origin.y)) {
                                 frameDoodler.origin.y = framePlatformSimpleRed1.origin.y - 55;
                                 if (isIncrementablePlatform1 && [_labelWin isHidden]) {
                                     _labelScore.text = [NSString stringWithFormat:@"%ld", (long)([_labelScore.text integerValue] + 10)];
                                     isIncrementablePlatform1 = NO;
                                 }
                             }
                             else if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed2.origin.x) &&
                                      (frameDoodler.origin.x < framePlatformSimpleRed2.origin.x + widthPlatform - 10) &&
                                      (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed2.origin.y)) {
                                 frameDoodler.origin.y = framePlatformSimpleRed2.origin.y - 55;
                                 if (isIncrementablePlatform2 && [_labelWin isHidden]) {
                                     _labelScore.text = [NSString stringWithFormat:@"%ld", (long)([_labelScore.text integerValue] + 10)];
                                     isIncrementablePlatform2 = NO;
                                 }
                             }
                             else if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed3.origin.x) &&
                                      (frameDoodler.origin.x < framePlatformSimpleRed3.origin.x + widthPlatform - 10) &&
                                      (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed3.origin.y)) {
                                 frameDoodler.origin.y = framePlatformSimpleRed3.origin.y - 55;
                                 if (isIncrementablePlatform3 && [_labelWin isHidden]) {
                                     _labelScore.text = [NSString stringWithFormat:@"%ld", (long)([_labelScore.text integerValue] + 10)];
                                     isIncrementablePlatform3 = NO;
                                 }
                             }
                             else if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed4.origin.x) &&
                                      (frameDoodler.origin.x < framePlatformSimpleRed4.origin.x + widthPlatform - 10) &&
                                      (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed4.origin.y)) {
                                 frameDoodler.origin.y = framePlatformSimpleRed4.origin.y - 55;
                                 //     NSLog(@"IsIncrementable1: @%d",isIncrementablePlatform1);
                                 if (isIncrementablePlatform4 && [_labelWin isHidden]) {
                                     _labelScore.text = [NSString stringWithFormat:@"%ld", (long)([_labelScore.text integerValue] + 10)];
                                     isIncrementablePlatform4 = NO;
                                 }
                             }
                             else if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed5.origin.x) &&
                                      (frameDoodler.origin.x < framePlatformSimpleRed5.origin.x + widthPlatform - 10) &&
                                      (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed5.origin.y)) {
                                 frameDoodler.origin.y = framePlatformSimpleRed5.origin.y - 55;
                                 if (isIncrementablePlatform5 && [_labelWin isHidden]) {
                                     _labelScore.text = [NSString stringWithFormat:@"%ld", (long)([_labelScore.text integerValue] + 10)];
                                     isIncrementablePlatform5 = NO;
                                 }
                                 // NSLog(@"Platform5- X: @%f, Y: @%f", frameDoodler.origin.x + heightDoodler, frameDoodler.origin.y);
                             }
                             else{
                                 while (frameDoodler.origin.y < 575) {
                                     if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed1.origin.x) &&
                                         (frameDoodler.origin.x < framePlatformSimpleRed1.origin.x + widthPlatform - 10) &&
                                         (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed1.origin.y)) {
                                         frameDoodler.origin.y = framePlatformSimpleRed1.origin.y - 55;
                                         if (isIncrementablePlatform1 && [_labelWin isHidden]) {
                                             _labelScore.text = [NSString stringWithFormat:@"%ld", (long)([_labelScore.text integerValue] + 10)];
                                             isIncrementablePlatform1 = NO;
                                         }
                                     }
                                     else if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed2.origin.x) &&
                                              (frameDoodler.origin.x < framePlatformSimpleRed2.origin.x + widthPlatform - 10) &&
                                              (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed2.origin.y)) {
                                         frameDoodler.origin.y = framePlatformSimpleRed2.origin.y - 55;
                                         if (isIncrementablePlatform2 && [_labelWin isHidden]) {
                                             _labelScore.text = [NSString stringWithFormat:@"%ld", (long)([_labelScore.text integerValue] + 10)];
                                             isIncrementablePlatform2 = NO;
                                         }
                                     }
                                     else if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed3.origin.x) &&
                                              (frameDoodler.origin.x < framePlatformSimpleRed3.origin.x + widthPlatform - 10) &&
                                              (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed3.origin.y)) {
                                         frameDoodler.origin.y = framePlatformSimpleRed3.origin.y - 55;
                                         if (isIncrementablePlatform3 && [_labelWin isHidden]) {
                                             _labelScore.text = [NSString stringWithFormat:@"%ld", (long)([_labelScore.text integerValue] + 10)];
                                             isIncrementablePlatform3 = NO;
                                         }
                                     }
                                     else if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed4.origin.x) &&
                                              (frameDoodler.origin.x < framePlatformSimpleRed4.origin.x + widthPlatform - 10) &&
                                              (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed4.origin.y)) {
                                         frameDoodler.origin.y = framePlatformSimpleRed4.origin.y - 55;
                                         if (isIncrementablePlatform4 && [_labelWin isHidden]) {
                                             _labelScore.text = [NSString stringWithFormat:@"%ld", (long)([_labelScore.text integerValue] + 10)];
                                             isIncrementablePlatform4 = NO;
                                         }
                                     }
                                     else if ((frameDoodler.origin.x + widthDoodler - 30 > framePlatformSimpleRed5.origin.x) &&
                                              (frameDoodler.origin.x < framePlatformSimpleRed5.origin.x + widthPlatform - 10) &&
                                              (frameDoodler.origin.y + heightDoodler < framePlatformSimpleRed5.origin.y)) {
                                         frameDoodler.origin.y = framePlatformSimpleRed5.origin.y - 55;
                                         if (isIncrementablePlatform5 && [_labelWin isHidden]) {
                                             _labelScore.text = [NSString stringWithFormat:@"%ld", (long)([_labelScore.text integerValue] + 10)];
                                             isIncrementablePlatform5 = NO;
                                         }
                                         //      NSLog(@"Platform5- X: @%f, Y: @%f", frameDoodler.origin.x + heightDoodler, frameDoodler.origin.y);
                                     }
                                     else{
                                         frameDoodler.origin.y += 300;
                                         //   NSLog(@"Falling- X: @%f, Y: @%f", frameDoodler.origin.x + heightDoodler, frameDoodler.origin.y);
                                     }
                                 }
                             }
                             self.imageDoodler.frame = frameDoodler;
                         }];
                     }
     ];
        }
}

//pause and resume handler
- (IBAction)pushButtonPause:(id)sender {
    isPaused = YES;
    [_buttonPause setHidden:YES];
    [_buttonResume setHidden:NO];
}
- (IBAction)pushButtonresume:(id)sender {
    isPaused = NO;
    [_buttonPause setHidden:NO];
    [_buttonResume setHidden:YES];
}

-(void)moveLeftRight:timer{
        if (!isPaused) {
    //    if (counterForHidingDoodler == 5) {
    //        [_imageDoodler setHidden:NO];
    //        counterForHidingDoodler = 0;
    //    }
    [UIView animateWithDuration:0.5 animations:^{
        CGRect imageFrame = self.imageDoodler.frame;
        if (imageFrame.origin.x >= 0 && imageFrame.origin.x <= 327) {
            imageFrame.origin.x = _slider.value * 327;
        }
        //  NSLog(@"Slider out: @%f, X: @%f", _slider.value, imageFrame.origin.x);
        
        //        if (163.5 - ((0.5 - _slider.value) * 327 * sliderSensitivity) >= 0 && 163.5 + ((_slider.value - 0.5) * 327 * sliderSensitivity) <= 327) {
        //            if (_slider.value == 0.5) {
        //                imageFrame.origin.x = 163.5;
        //            }
        //            else if(_slider.value < 0.5) {
        //                imageFrame.origin.x = 163.5 - ((0.5 - _slider.value) * 327 * sliderSensitivity);
        //                NSLog(@"Slider Left: @%f, X: @%f", _slider.value, imageFrame.origin.x);
        //            }
        //            else if(_slider.value > 0.5) {
        //                imageFrame.origin.x = 163.5 + ((_slider.value - 0.5) * 327 * sliderSensitivity);
        //                NSLog(@"Slider Right: @%f,X: @%f", _slider.value, imageFrame.origin.x);
        //
        //            }
        //        }
        
        //        if (imageFrame.origin.x < 0) {
        //            imageFrame.origin.x = 300;
        //            [_imageDoodler setHidden:YES];
        //        }
        //        self.imageDoodler.frame = imageFrame;
        //        if ([_imageDoodler isHidden]) {
        //            counterForHidingDoodler++;
        //        }
        
        
        
        //         if (imageFrame.origin.x >= 275) {
        //            NSLog(@"Greater than right.........");
        //            imageFrame.origin.x = 0 * 327;
        //        }
        //        else if (imageFrame.origin.x >= 0 && imageFrame.origin.x <= 327) {
        //            imageFrame.origin.x = _slider.value * 327;
        //        }
        
        //        NSLog(@"MoveRightLeft- Slider value: @%f, Doodler value: @%f", _slider.value, _slider.value * 327);
        self.imageDoodler.frame = imageFrame;
    }];
        }
}


@end
