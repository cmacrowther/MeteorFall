//
//  PlayViewController.h
//  MeteorFall
//
//  Created by iOS Developer on 2015-03-11.
//  Copyright (c) 2015 UPEI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayViewController : UIViewController
{
    NSString *path1;//path for data persistence
    NSString *data1;//data 
    NSString *text1;//text
    
    IBOutletCollection(UIImageView) NSArray *meteorArray;
    
    NSTimer *movementTimer;//Moves Meteors
    NSTimer *scoreTimer;//Increases score
    NSTimer *increaseDifficulty;//BETA increases difficulty as time passes
    
    NSInteger score;//Players Score
    NSInteger meteorsDodged;
    NSInteger stagger;//the delay randomness in a wave
    NSInteger setMetCheck;//After setting images check if its first movement
    NSInteger missingMeteor;//Missing Meteor random int for wave 1
    NSInteger missingMeteor1;//Missing Meteor random int for wave 2
}
@property UIViewController *currViewController;//next view

@property NSInteger gap; //Gap between waves
@property double pixMove;//Pixels moved per movement

- (IBAction)rightButtonAction:(id)sender;//Move right
- (IBAction)leftButtonAction:(id)sender;//Move left
@property (weak, nonatomic) IBOutlet UIButton *rightButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *leftButtonOutlet;


@property (weak, nonatomic) IBOutlet UIImageView *gameOverOutlet;//Game over pic
@property (weak, nonatomic) IBOutlet UILabel *scoreOutlet;//Score Label

@property (weak, nonatomic) IBOutlet UIImageView *hero;//Character pic
@property (weak, nonatomic) IBOutlet UILabel *scoreTextOutlet;//scoreText
@property (weak, nonatomic) IBOutlet UILabel *highscoreTextOutlet;//highscoreText
@property (weak, nonatomic) IBOutlet UILabel *highscoreOutlet;//highscore Label


//Meteor pics
@property (weak, nonatomic) IBOutlet UIImageView *meteor1Outlet;
@property (weak, nonatomic) IBOutlet UIImageView *meteor2Outlet;
@property (weak, nonatomic) IBOutlet UIImageView *meteor3Outlet;
@property (weak, nonatomic) IBOutlet UIImageView *meteor4Outlet;
@property (weak, nonatomic) IBOutlet UIImageView *meteor5Outlet;
@property (weak, nonatomic) IBOutlet UIImageView *meteor6Outlet;
@property (weak, nonatomic) IBOutlet UIImageView *meteor7Outlet;
@property (weak, nonatomic) IBOutlet UIImageView *meteor8Outlet;
@property (weak, nonatomic) IBOutlet UIImageView *meteor9Outlet;
@property (weak, nonatomic) IBOutlet UIImageView *meteor10Outlet;

//Start Button
- (IBAction)startButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *startButtonOutlet;

//Restart Button
- (IBAction)restartButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *restartButtonOutlet;

//Main Menu Button
- (IBAction)mainMenuButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *mainMenuButtonOutlet;

@end
