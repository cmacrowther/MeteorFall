//
//  MainViewController.h
//  MeteorFall
//
//  Created by iOS Developer on 2015-03-11.
//  Copyright (c) 2015 UPEI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MainViewController : UIViewController <AVAudioPlayerDelegate>
{
    NSMutableArray *imageArray;//Array for Animated Title
    AVAudioPlayer *player;//AudioPlayer
}

@property (nonatomic, retain) AVAudioPlayer *player;
@property UIViewController *currViewController;//to change view
@property UIImageView *animatedImage;
@property NSInteger musicCheck;

//Button Action Methods
- (IBAction)playButtonAction:(id)sender;//Play Screen
- (IBAction)optionsButtonAction:(id)sender;//Options Screen
- (IBAction)statsButtonAction:(id)sender;//Statistics Screen
- (IBAction)instructButtonAction:(id)sender;//Instructions Screen
- (IBAction)aboutButtonAction:(id)sender;//About Screen

@end
