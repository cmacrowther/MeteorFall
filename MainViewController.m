//
//  MainViewController.m
//  MeteorFall
//
//  Created by iOS Developer on 2015-03-11.
//  Copyright (c) 2015 UPEI. All rights reserved.
//

#import "MainViewController.h"
#import "PlayViewController.h"
#import "OptionsViewController.h"
#import "StatsViewController.h"
#import "InstructViewController.h"
#import "AboutViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize player;

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
    
    // Load images
    NSArray *imageNames = @[@"logoP3.png", @"logoP2.png", @"logoP3.png", @"logoP4.png"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    // Normal Animation
    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(-3, 40, 400, 250)];
    animationImageView.animationImages = images;
    animationImageView.animationDuration = 0.4;
    
    [self.view addSubview:animationImageView];
    [animationImageView startAnimating];
    
    //The following is responsible for playing the audio
    
    if(_musicCheck == 0)
    {
        NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
        resourcePath = [resourcePath stringByAppendingString:@"/mfall.m4a"];
        NSError* err;
    
    //Initialize our player pointing to the path to our resource
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:
                [NSURL fileURLWithPath:resourcePath] error:&err];
    
        if(err)
        {
            //bail!
            NSLog(@"Failed with reason: %@", [err localizedDescription]);
        }
        else{
        //set our delegate and begin playback
            player.delegate = self;
        
            [player play];
            player.numberOfLoops = -1;
            player.currentTime = 0;
            player.volume = 0.05;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) shouldAutorotate
{
    return NO;
}

//IGNORe
- (IBAction)muteButtonAction:(id)sender
{
    if([player isPlaying])
    {
        [player stop];
    }
    else
    {
        [player play];
    }
    
}


- (IBAction)playButtonAction:(id)sender {
    
    [self setCurrViewController:[[PlayViewController alloc]initWithNibName:@"PlayViewController" bundle:nil]];
    UIWindow *win = [[UIApplication sharedApplication]keyWindow];
    
    [[self view] removeFromSuperview];
    [win addSubview:[_currViewController view]];
    
    
}

- (IBAction)optionsButtonAction:(id)sender {
    [self setCurrViewController:[[OptionsViewController alloc]initWithNibName:@"OptionsViewController" bundle:nil]];
    UIWindow *win = [[UIApplication sharedApplication]keyWindow];
    
    [[self view] removeFromSuperview];
    [win addSubview:[_currViewController view]];
}

- (IBAction)statsButtonAction:(id)sender {
    [self setCurrViewController:[[StatsViewController alloc]initWithNibName:@"StatsViewController" bundle:nil]];
    UIWindow *win = [[UIApplication sharedApplication]keyWindow];
    
    [[self view] removeFromSuperview];
    [win addSubview:[_currViewController view]];
}

- (IBAction)instructButtonAction:(id)sender {
    [self setCurrViewController:[[InstructViewController alloc]initWithNibName:@"InstructViewController" bundle:nil]];
    UIWindow *win = [[UIApplication sharedApplication]keyWindow];
    
    [[self view] removeFromSuperview];
    [win addSubview:[_currViewController view]];
}

- (IBAction)aboutButtonAction:(id)sender {
    [self setCurrViewController:[[AboutViewController alloc]initWithNibName:@"AboutViewController" bundle:nil]];
    UIWindow *win = [[UIApplication sharedApplication]keyWindow];
    
    [[self view] removeFromSuperview];
    [win addSubview:[_currViewController view]];
}
@end
