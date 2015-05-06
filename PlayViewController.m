//
//  PlayViewController.m
//  MeteorFall
//
//  Created by iOS Developer on 2015-03-11.
//  Copyright (c) 2015 UPEI. All rights reserved.
//

#import "PlayViewController.h"
#import "OptionsViewController.h"
#import "MainViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Get Hero Skin
    [self getDataWithExtension:@"skin.data"];
    
    //set default
    if (data1 == nil) {
        text1 = @"gameHero1.png";
    }
    
    _hero.image = [UIImage imageNamed:text1];
    
    stagger = 200;//pixels to stagger meteor
    
    //Get difficulty string from archive
    NSString *path = [self getArchivePath:@"difficulty.data"];
    NSString *p = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    
    //Set Difficulties
    if([p  isEqual: @"medium"])
    {
        [self setPixMove:5];
        [self setGap:400];
    }
    else if([p  isEqual: @"hard"])
    {
        [self setPixMove:5.5];
        [self setGap:385];
    }
    else //easy
    {
        [self setPixMove:4];
        [self setGap:450];
    }
    
    //Add meteors to meteorArray
    meteorArray = [NSArray arrayWithObjects:_meteor1Outlet,_meteor2Outlet,_meteor3Outlet,_meteor4Outlet,_meteor5Outlet,_meteor6Outlet,_meteor7Outlet,_meteor8Outlet,_meteor9Outlet,_meteor10Outlet, nil];

    //Hide Button and gameover image
    _scoreTextOutlet.hidden = YES;
    _highscoreTextOutlet.hidden = YES;
    _highscoreOutlet.hidden = YES;
    _restartButtonOutlet.hidden = YES;
    _mainMenuButtonOutlet.hidden = YES;
    _gameOverOutlet.hidden = YES;
}
//Move right
- (IBAction)rightButtonAction:(id)sender {
    if (_hero.center.x + 64 <= 320){
        _hero.center = CGPointMake(_hero.center.x + 64, _hero.center.y);
    }
}
//Move left
- (IBAction)leftButtonAction:(id)sender {
    if (_hero.center.x - 64 >= 0){
    _hero.center = CGPointMake(_hero.center.x - 64, _hero.center.y);
    }
}
//Start Button
- (IBAction)startButtonAction:(id)sender {
    
    setMetCheck = 0;
    
    //hide start button
    _startButtonOutlet.hidden = YES;
    
    //Set meteors
    [self SetMeteorsWaveOne: YES waveTwo: YES];
    
    //Start timers
    scoreTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(score) userInfo:nil repeats:YES];
    movementTimer = [NSTimer scheduledTimerWithTimeInterval:0.015 target:self selector:@selector(MoveMeteors) userInfo:nil repeats:YES];
    //increaseDifficulty = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(increaseDifficulty) userInfo:nil repeats:YES];
}
//Restart Button
- (IBAction)restartButtonAction:(id)sender {
    
    _gap = 0;//reset
    _pixMove = 0;//reset
    
    [self setCurrViewController:[[PlayViewController alloc]initWithNibName:@"PlayViewController" bundle:nil]];
    UIWindow *win = [[UIApplication sharedApplication]keyWindow];
    
    [[self view] removeFromSuperview];
    [win addSubview:[_currViewController view]];
    
}
//Main Menu Button
- (IBAction)mainMenuButtonAction:(id)sender {
    
    
    MainViewController *mvc =[[MainViewController alloc]initWithNibName:@"MainViewController" bundle:nil];
    [mvc setMusicCheck:1];
    [self setCurrViewController:mvc];
    UIWindow *win = [[UIApplication sharedApplication]keyWindow];
    
    [[self view] removeFromSuperview];
    [win addSubview:[_currViewController view]];
}
//Set meteors to top of screen
-(void)SetMeteorsWaveOne:(BOOL)one waveTwo:(BOOL)two
{
    
    if(one == YES)//Set Waves
    {
        setMetCheck = 0;
        for(int i=0; i<5 ;i++)//First Wave
        {
            UIImageView *imageView = (UIImageView*) meteorArray[i];
            imageView.center = CGPointMake(imageView.center.x, -32);
        }
        for(int i=5; i<10 ;i++)//Second Wave
        {
            UIImageView *imageView = (UIImageView*) meteorArray[i];
            imageView.center = CGPointMake(imageView.center.x, -(32+_gap));
        }
    }
}
//Move meteors
-(void)MoveMeteors {
    
    if (setMetCheck == 0)//First Moved
    {
        NSInteger delay;//random delay
        
        
        //Set a random delay for each meteor
        for (int i=0; i< 10; i++) {
            delay = arc4random_uniform(stagger);
            UIImageView *imageView = (UIImageView*) meteorArray[i];
            imageView.center = CGPointMake(imageView.center.x, imageView.center.y - delay);
        }
        setMetCheck = 1; //No longer first move
        
        //Random missing meteor for each wave
        missingMeteor = arc4random_uniform(5);//wave 1
        missingMeteor1 = arc4random_uniform(5)+5;//wave 2
    }
    
    //First wave meteors movement
    for (int i=0; i<5; i++) {
        
        //If not the missing meteor
        if (i != missingMeteor) {
            
            //Move
            UIImageView *imageView = (UIImageView*) meteorArray[i];
            imageView.center = CGPointMake(imageView.center.x, imageView.center.y+_pixMove);
            
            //If collision with Hero
            if (CGRectIntersectsRect(_hero.frame, imageView.frame)) {
                
                [self gameOver];//Game Over
            }
            
        }
    }
    
    //Second wave meteors movement
    for (int i=5; i<10; i++) {
        
        //If not missing meteor
        if (i != missingMeteor1) {
            
            //Move
            UIImageView *imageView = (UIImageView*) meteorArray[i];
            imageView.center = CGPointMake(imageView.center.x, imageView.center.y+_pixMove);

            //If collision with Hero
            if (CGRectIntersectsRect(_hero.frame, imageView.frame)) {
                [self gameOver];
            }
            
            //If second wave is off screen reset all waves
            if(imageView.center.y >= 800)
            {
                meteorsDodged = meteorsDodged + 8;
                [self SetMeteorsWaveOne: YES waveTwo:YES];
            }
        }
    }
    
}
//When hit with meteor
-(void)gameOver
{
    //Stop timers
    [movementTimer invalidate];
    [scoreTimer invalidate];
    
    //Disable buttons
    _rightButtonOutlet.enabled = NO;
    _leftButtonOutlet.enabled = NO;
    
    //Move restart button down
    _restartButtonOutlet.center = CGPointMake(_restartButtonOutlet.center.x, _restartButtonOutlet.center.y + 31);
    
    //Move score
    _scoreOutlet.center = CGPointMake(40, 118);
    
    //unhide labels
    _scoreTextOutlet.hidden = NO;
    _highscoreTextOutlet.hidden = NO;
    _highscoreOutlet.hidden = NO;

    //Unhide button and game over pic
    _restartButtonOutlet.hidden = NO;
    _mainMenuButtonOutlet.hidden = NO;
    _gameOverOutlet.hidden = NO;
    
    
    //Get highscore
    NSString *path = [self getHighScorePath];
    NSString *p = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    //Compare highscore to score
    NSInteger myInt = [p intValue];
    
    [_highscoreOutlet setText:p];
    
    if (score > myInt) {
        NSString *path = [self getHighScorePath];
        [NSKeyedArchiver archiveRootObject:[NSString stringWithFormat:@"%d",score] toFile:path];
    }
    
    //Rounds Played
    path = [self getArchivePath:@"roundsPlayed.data"];
    p = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    if(p == nil)
    {
        [NSKeyedArchiver archiveRootObject:[NSString stringWithFormat:@"%d", 1] toFile:path];
    }
    else
    {
        NSInteger i = [p integerValue];
        i++;
        [NSKeyedArchiver archiveRootObject:[NSString stringWithFormat:@"%d", i] toFile:path];
    }
    
    //Total time dodging
    path = [self getArchivePath:@"totalTimeDodging.data"];
    p = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if(p == nil)
    {
        [NSKeyedArchiver archiveRootObject:[NSString stringWithFormat:@"%d", score] toFile:path];
    }
    else
    {
        NSInteger i = [p integerValue];
        i = i+score;
        [NSKeyedArchiver archiveRootObject:[NSString stringWithFormat:@"%d", i] toFile:path];
    }
    
    //Total meteors dodged
    path = [self getArchivePath:@"totalMeteorsDodged.data"];
    p = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if(p == nil)
    {
        [NSKeyedArchiver archiveRootObject:[NSString stringWithFormat:@"%d", meteorsDodged] toFile:path];
    }
    else
    {
        NSInteger i = [p integerValue];
        i = i+meteorsDodged;
        [NSKeyedArchiver archiveRootObject:[NSString stringWithFormat:@"%d", i] toFile:path];
    }
}

-(NSString*)getHighScorePath//gets Highscore path
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex: 0];
    
    //Get difficulty string from archive
    NSString *diffpath = [self getArchivePath: @"difficulty.data"];
    NSString *difficulty = [NSKeyedUnarchiver unarchiveObjectWithFile:diffpath];
    NSString *value;    //var to hold the string to return from method cause xcode is stupid
    
    //Determine which highscore to return depending on difficulty
    if([difficulty  isEqual: @"easy"]){
        value = [documentDirectory stringByAppendingPathComponent:@"easyHighscore.data"];
    }else if([difficulty isEqual: @"medium"]){
        value = [documentDirectory stringByAppendingPathComponent:@"mediumHighscore.data"];
    }else if([difficulty isEqual: @"hard"]){
        value = [documentDirectory stringByAppendingPathComponent:@"hardHighscore.data"];
    }
    return value;
}
//Increase score
-(void)score
{
    score = score + 1;//increment
    
    NSString *text = [NSString stringWithFormat:@"%d",score];
    [_scoreOutlet setText:text];//set label text
}

//NOT IN CURRENT BUILD - Increses difficulty
-(void)increaseDifficulty
{
    if(_gap > 360)
    {
        _gap = _gap - 10;
        
    }
    if(_pixMove < 7)
    {
        _pixMove = _pixMove + .25;
    }
}
//Sets the data from the given extension
-(void)getDataWithExtension:(NSString*)pathExtension
{
    path1 = [self getArchivePath:pathExtension];
    data1 = [NSKeyedUnarchiver unarchiveObjectWithFile:path1];
    text1 = [NSString stringWithFormat:@"%@",data1];
}
//Get path of data from given extension
-(NSString*)getArchivePath:(NSString*)pathExtension//Gets archive path
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory = [paths objectAtIndex: 0];
    return [documentDirectory stringByAppendingPathComponent:pathExtension];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
