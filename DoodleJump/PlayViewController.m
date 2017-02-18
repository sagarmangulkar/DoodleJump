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
    [UIView animateWithDuration:1.0 animations:^{
        CGRect imageFrame = self.imageDoodler.frame;
        if (imageFrame.origin.y > 0) {
            imageFrame.origin.y -= 200;
        }
        if (imageFrame.origin.x >= 0 && imageFrame.origin.x <= 327) {
            imageFrame.origin.x = _slider.value * 327;
        }
   //     NSLog(@"Slider value: @%f, Doodler value: @%f", _slider.value, _slider.value * 327);
        self.imageDoodler.frame = imageFrame;
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1.0 animations:^{
                             CGRect imageFrame = self.imageDoodler.frame;
                             imageFrame.origin.y += 200;
                             self.imageDoodler.frame = imageFrame;
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

- (IBAction)buttonTest:(id)sender {
    
  //  [self jump];
    
//    [UIView animateWithDuration:1.0 animations:^{
//        CGRect imageFrame = self.imageDoodler.frame;
//        imageFrame.origin.y -= 200;
//        self.imageDoodler.frame = imageFrame;
//    }
//                     completion:^(BOOL finished){
//                         [UIView animateWithDuration:1.0 animations:^{
//                             CGRect imageFrame = self.imageDoodler.frame;
//                             imageFrame.origin.y += 200;
//                             self.imageDoodler.frame = imageFrame;
//                         }];
//                     }
//     ];
}

@end
