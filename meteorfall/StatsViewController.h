//
//  StatsViewController.h
//  MeteorFall
//
//  Created by iOS Developer on 2015-03-11.
//  Copyright (c) 2015 UPEI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatsViewController : UIViewController
{
    //for data path ,data ,and text
    NSString *path;
    NSString *data;
    NSString *text;
}
- (IBAction)backButtonAction:(id)sender;

//Labels for stats
@property (weak, nonatomic) IBOutlet UILabel *hardHighScoreOutlet;
@property (weak, nonatomic) IBOutlet UILabel *mediumHighScoreOutlet;
@property (weak, nonatomic) IBOutlet UILabel *easyHighScoreOutlet;
@property (weak, nonatomic) IBOutlet UILabel *averageHighScoreOutlet;
@property (weak, nonatomic) IBOutlet UILabel *roundsPlayedOutlet;
@property (weak, nonatomic) IBOutlet UILabel *totalTimeDodgingOutlet;
@property (weak, nonatomic) IBOutlet UILabel *totalMeteorsDodgedOutlet;

@end
