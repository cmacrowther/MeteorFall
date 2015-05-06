//
//  StatsViewController.m
//  MeteorFall
//
//  Created by iOS Developer on 2015-03-11.
//  Copyright (c) 2015 UPEI. All rights reserved.
//

#import "StatsViewController.h"

@interface StatsViewController ()

@end

@implementation StatsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //temp values
    NSInteger temp1;
    NSInteger temp2;
    NSInteger temp3;
    // Do any additional setup after loading the view from its nib.
    
    
   //Getting data setting statistics
   [self getDataWithExtension:@"hardHighscore.data"];
    
    if (data == nil) {
            [_hardHighScoreOutlet setText:@"0"];
    }
    else
    {
        temp1 = [data intValue];
        [_hardHighScoreOutlet setText:text];//set label text
    }
    
    [self getDataWithExtension:@"mediumHighscore.data"];
    
    if (data == nil) {
        [_mediumHighScoreOutlet setText:@"0"];
    }
    else
    {
        temp2 = [data intValue];
        [_mediumHighScoreOutlet setText:text];//set label text
    }
    
    [self getDataWithExtension:@"easyHighscore.data"];
    
    if (data == nil) {
        [_easyHighScoreOutlet setText:@"0"];
    }
    else
    {
        temp3 = [data intValue];
        [_easyHighScoreOutlet setText:text];//set label text
    }
    [self getDataWithExtension:@"roundsPlayed.data"];
    
    if (data == nil) {
        [_roundsPlayedOutlet setText:@"0"];
    }
    else
    [_roundsPlayedOutlet setText:text];
    
    [self getDataWithExtension:@"totalTimeDodging.data"];
    
    if (data == nil) {
        [_totalTimeDodgingOutlet setText:@"0"];
    }
    else
        [_totalTimeDodgingOutlet setText:text];
    
    [self getDataWithExtension:@"totalMeteorsDodged.data"];
    
    if (data == nil) {
        [_totalMeteorsDodgedOutlet setText:@"0"];
    }
    else
        [_totalMeteorsDodgedOutlet setText:text];
    
    //Get average highscore
    NSInteger averageScore = (temp1 + temp2 + temp3)/3;
    text = [NSString stringWithFormat:@"%d", averageScore];
    [_averageHighScoreOutlet setText:text];//set label text
    
}
//Get data with Extension
-(void)getDataWithExtension:(NSString*)pathExtension
{
    path = [self getArchivePath:pathExtension];
    data = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    text = [NSString stringWithFormat:@"%@",data];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//Get path
-(NSString*)getArchivePath:(NSString*)pathExtension//gets archive saved
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex: 0];
    return [documentDirectory stringByAppendingPathComponent:pathExtension];
}
//Back Button Action
- (IBAction)backButtonAction:(id)sender {
    UIWindow *win = [[UIApplication sharedApplication]keyWindow];
    UIViewController *rootController = [win rootViewController];
    
    [[self view] removeFromSuperview];
    [win addSubview:[rootController view]];
    
}
@end
