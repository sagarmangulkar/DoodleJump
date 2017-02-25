//
//  PlayViewController.h
//  DoodleJump
//
//  Created by Sagar Mangulkar on 2/17/17.
//  Copyright © 2017 Sagar Mangulkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageDoodler;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UIImageView *platformSimpleRed1;
@property (strong, nonatomic) IBOutlet UIImageView *platformSimpleRed2;
@property (strong, nonatomic) IBOutlet UIImageView *platformSimpleRed3;
@property (strong, nonatomic) IBOutlet UIImageView *platformSimpleRed4;
@property (strong, nonatomic) IBOutlet UIImageView *platformSimpleRed5;
@property (strong, nonatomic) IBOutlet UILabel *labelGameOver;
@property (strong, nonatomic) IBOutlet UIButton *buttonPlayAgain;
@property (strong, nonatomic) IBOutlet UILabel *labelWin;
@property (strong, nonatomic) IBOutlet UIImageView *imageMonster1;
@property (strong, nonatomic) IBOutlet UILabel *labelScore;
@property (strong, nonatomic) IBOutlet UILabel *labelYourScore;
@property (strong, nonatomic) IBOutlet UILabel *labelDisplayScore;
@property (strong, nonatomic) IBOutlet UILabel *labelMaxScore;
@property (retain, nonatomic) NSString *maxScore;
@property (strong, nonatomic) IBOutlet UIButton *buttonPause;
@property (strong, nonatomic) IBOutlet UIButton *buttonResume;

@end
