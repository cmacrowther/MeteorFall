//
//  OptionsViewController.m
//  MeteorFall
//
//  Created by iOS Developer on 2015-03-11.
//  Copyright (c) 2015 UPEI. All rights reserved.
//

#import "OptionsViewController.h"
#import "PlayViewController.h"
#import "SkinsViewController.h"

@interface OptionsViewController ()

@end

@implementation OptionsViewController

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
    
    //Get the difficulty option data
    NSString *path = [self getArchivePath];
    NSString *p = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    
    //Highlight the proper button by what difficulty is currently set
    if([p  isEqual: @"medium"])
    {
        [_mediumButtonOutlet setSelected:YES];
    }
    else if([p  isEqual: @"hard"])
    {
        [_hardButtonOutlet setSelected:YES];
    }
    else //easy
    {
        [_easyButtonOutlet setSelected:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Skin button Action
- (IBAction)skinsButtonAction:(id)sender {
    [self setCurrViewController:[[SkinsViewController alloc]initWithNibName:@"SkinsViewController" bundle:nil]];
    UIWindow *win = [[UIApplication sharedApplication]keyWindow];
    
    [[self view] removeFromSuperview];
    [win addSubview:[_currViewController view]];
}
//Back button Action
- (IBAction)backButtonAction:(id)sender {
    UIWindow *win = [[UIApplication sharedApplication]keyWindow];
    UIViewController *rootController = [win rootViewController];
    
    [[self view] removeFromSuperview];
    [win addSubview:[rootController view]];
    
}

//Return path
-(NSString*)getArchivePath//gets archive saved
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory = [paths objectAtIndex: 0];
    return [documentDirectory stringByAppendingPathComponent:@"difficulty.data"];
}
//Easy Button Action
- (IBAction)easyButtonAction:(id)sender {
    
    //Highlight proper button
    [_mediumButtonOutlet setSelected:NO];
    [_easyButtonOutlet setSelected:YES];
    [_hardButtonOutlet setSelected:NO];
    
    //Set difficulty to easy
    NSString *path = [self getArchivePath];
    [NSKeyedArchiver archiveRootObject:@"easy" toFile:path];
}
//Medium Button Action
- (IBAction)mediumButtonAction:(id)sender {
    
    //Highlight proper button
    [_mediumButtonOutlet setSelected:YES];
    [_easyButtonOutlet setSelected:NO];
    [_hardButtonOutlet setSelected:NO];
    
    //Set difficulty to medium
    NSString *path = [self getArchivePath];
    [NSKeyedArchiver archiveRootObject:@"medium" toFile:path];
}
//Hard Button Action
- (IBAction)hardButtonAction:(id)sender {
    
    //Highlight proper button
    [_mediumButtonOutlet setSelected:NO];
    [_easyButtonOutlet setSelected:NO];
    [_hardButtonOutlet setSelected:YES];
    
    //Set difficulty to hard
    NSString *path = [self getArchivePath];
    [NSKeyedArchiver archiveRootObject:@"hard" toFile:path];
}
//Reset Stats Button Action
- (IBAction)resetButtonAction:(id)sender {
    
    //Make alert screen pop up
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Reset Stats" message:@"Are you sure you want to reset your stats?"
    delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    
    //Show alert
	[alert show];
}
//Alert Button click Action
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //If yes is clicked
    if(buttonIndex == 1)
    {
        [self resetStats];//Reset stats
    }
}
//Reset stats method
-(void)resetStats
{
    //Array of data files to reset
    NSArray *stats = [NSArray arrayWithObjects:@"easyHighscore.data",@"mediumHighscore.data",@"hardHighscore.data",@"roundsPlayed.data",@"totalMeteorsDodged.data",@"totalTimeDodging.data", nil];
    
    //loop array setting strings to 0
    for (int i=0; i<[stats count]; i++) {
        NSString *path = [self getArchivePath:stats[i]];
        [NSKeyedArchiver archiveRootObject:[NSString stringWithFormat:@"%d", 0] toFile:path];
    }
    
    //Reset skin
    NSString *path = [self getArchivePath:@"skins.data"];
    [NSKeyedArchiver archiveRootObject:@"nil" toFile:path];
   
}
//Get path of data extension
-(NSString*)getArchivePath:(NSString*)pathExtension//gets archive saved
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex: 0];
    return [documentDirectory stringByAppendingPathComponent:pathExtension];
}
@end
