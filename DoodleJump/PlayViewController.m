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
}

-(void)jump:timer{
    //simple jump
    [UIView animateWithDuration:1.0 animations:^{
        CGRect imageFrame = self.imageDoodler.frame;
        imageFrame.origin.y -= 200;
 //       imageFrame.origin.x = _slider.value * 100;
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
    
    //moving left-right
    NSLog(@"Slider value: @%f", _slider.value);
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
