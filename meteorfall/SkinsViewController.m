//
//  SkinsViewController.m
//  meteorfall
//
//  Created by iOS Developer on 2015-04-02.
//  Copyright (c) 2015 UPEI. All rights reserved.
//

#import "SkinsViewController.h"

@interface SkinsViewController ()

@end

@implementation SkinsViewController

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
    //Get skin
    NSString *path = [self getArchivePath:@"skin.data"];
    NSString *p = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    //Set current skin
     UIImage *skin = [UIImage imageNamed:p];
     _currentSkinOutlet.image = skin;
    
    //CHECKING ACHIEVEMENTS FOR SKINS UNLOCK
    //Get data
    path = [self getArchivePath:@"totalMeteorsDodged.data"];
    p = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSInteger myInt = [p intValue];
    
    //Total meteors dodge over 1000
    if (myInt < 1000) {
        _button2Outlet.alpha = 0.4;
        _button2Outlet.enabled = NO;
    }else{
        _button2Outlet.enabled = YES;
    }
    
    //Get data
    path = [self getArchivePath:@"easyHighscore.data"];
    p = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    myInt = [p intValue];
    
    
    //Easy highscore over 50
    if (myInt < 50) {
        _button3Outlet.alpha = .4;
        _button3Outlet.enabled = NO;
    }else{
        _button3Outlet.enabled = YES;
    }
    
    //Get data
    path = [self getArchivePath:@"mediumHighscore.data"];
    p = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    myInt = [p intValue];
    
    
    //Medium highscore over 50
    if (myInt < 50) {
        _button4Outlet.alpha = .4;
        _button4Outlet.enabled = NO;
    }else{
        _button4Outlet.enabled = YES;
    }
    
    //Get data
    path = [self getArchivePath:@"hardHighscore.data"];
    p = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    myInt = [p intValue];
    
    
    //Hard highscore over 50
    if (myInt < 50) {
        _button5Outlet.alpha = .4;
        _button5Outlet.enabled = NO;
    }else{
        _button5Outlet.enabled = YES;
    }
    
    //Get data
    path = [self getArchivePath:@"hardHighscore.data"];
    p = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    myInt = [p intValue];
    
    
    //Hard higscore over 50
    if (myInt < 100) {
        _button6Outlet.alpha = .4;
        _button6Outlet.enabled = NO;
    }else{
        _button6Outlet.enabled = YES;
    }
    
    
    
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.scrollViewOutlet layoutIfNeeded];
    self.scrollViewOutlet.contentSize = self.subViewOutlet.bounds.size;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//Set skin 1
- (IBAction)skin1Action:(id)sender {
    
    //Get path set data to skin
    NSString *path = [self getArchivePath:@"skin.data"];
    [NSKeyedArchiver archiveRootObject:[NSString stringWithFormat:@"gameHero1.png"] toFile:path];
    
    //Set Current skin at top
    _currentSkinOutlet.image = [UIImage imageNamed:@"gameHero1.png"];
    
    
    //ENABLE/DISABLE Buttons
    [_button1Outlet setSelected:YES];
    [_button2Outlet setSelected:NO];
    [_button3Outlet setSelected:NO];
    [_button4Outlet setSelected:NO];
    [_button5Outlet setSelected:NO];
    [_button6Outlet setSelected:NO];
    
}
//Set skin 2
- (IBAction)skin2Action:(id)sender {
    
    //Get path set data to skin
    NSString *path = [self getArchivePath:@"skin.data"];
    [NSKeyedArchiver archiveRootObject:[NSString stringWithFormat:@"gameHero3.png"] toFile:path];
    
    //Set Current skin at top
    UIImage *skin = [UIImage imageNamed:@"gameHero3.png"];
    _currentSkinOutlet.image = skin;
    
    //ENABLE/DISABLE Buttons
    [_button1Outlet setSelected:NO];
    [_button2Outlet setSelected:YES];
    [_button3Outlet setSelected:NO];
    [_button4Outlet setSelected:NO];
    [_button5Outlet setSelected:NO];
    [_button6Outlet setSelected:NO];
}
//Set skin 3
- (IBAction)skin3Action:(id)sender {
    
    //Get path set data to skin
    NSString *path = [self getArchivePath:@"skin.data"];
    [NSKeyedArchiver archiveRootObject:[NSString stringWithFormat:@"gameHero4.png"] toFile:path];
    
    //Set Current skin at top
    UIImage *skin = [UIImage imageNamed:@"gameHero4.png"];
    _currentSkinOutlet.image = skin;
    
    //ENABLE/DISABLE Buttons
    [_button1Outlet setSelected:NO];
    [_button2Outlet setSelected:NO];
    [_button3Outlet setSelected:YES];
    [_button4Outlet setSelected:NO];
    [_button5Outlet setSelected:NO];
    [_button6Outlet setSelected:NO];
}
//Set skin 4
- (IBAction)skin4Action:(id)sender {
    
    //Get path set data to skin
    NSString *path = [self getArchivePath:@"skin.data"];
    [NSKeyedArchiver archiveRootObject:[NSString stringWithFormat:@"gameHero5.png"] toFile:path];
    
    //Set Current skin at top
    UIImage *skin = [UIImage imageNamed:@"gameHero5.png"];
    _currentSkinOutlet.image = skin;
    
    //ENABLE/DISABLE Buttons
    [_button1Outlet setSelected:NO];
    [_button2Outlet setSelected:NO];
    [_button3Outlet setSelected:NO];
    [_button4Outlet setSelected:YES];
    [_button5Outlet setSelected:NO];
    [_button6Outlet setSelected:NO];
}
//Set skin 5
- (IBAction)skin5Action:(id)sender {
    
    //Get path set data to skin
    NSString *path = [self getArchivePath:@"skin.data"];
    [NSKeyedArchiver archiveRootObject:[NSString stringWithFormat:@"gameHero6.png"] toFile:path];
    
    //Set Current skin at top
    UIImage *skin = [UIImage imageNamed:@"gameHero6.png"];
    _currentSkinOutlet.image = skin;
    
    //ENABLE/DISABLE Buttons
    [_button1Outlet setSelected:NO];
    [_button2Outlet setSelected:NO];
    [_button3Outlet setSelected:NO];
    [_button4Outlet setSelected:NO];
    [_button5Outlet setSelected:YES];
    [_button6Outlet setSelected:NO];
}
//Set skin 6
- (IBAction)skin6Action:(id)sender {
    
    //Get path set data to skin
    NSString *path = [self getArchivePath:@"skin.data"];
    [NSKeyedArchiver archiveRootObject:[NSString stringWithFormat:@"gameHero2.png"] toFile:path];
    
    //Set Current skin at top
    UIImage *skin = [UIImage imageNamed:@"gameHero2.png"];
    _currentSkinOutlet.image = skin;
    
    //ENABLE/DISABLE Buttons
    [_button1Outlet setSelected:NO];
    [_button2Outlet setSelected:NO];
    [_button3Outlet setSelected:NO];
    [_button4Outlet setSelected:NO];
    [_button5Outlet setSelected:NO];
    [_button6Outlet setSelected:YES];
}

-(NSString*)getArchivePath:(NSString*)pathExtension//Gets archive path
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory = [paths objectAtIndex: 0];
    return [documentDirectory stringByAppendingPathComponent:pathExtension];
}

- (IBAction)backButtonAction:(id)sender {
    UIWindow *win = [[UIApplication sharedApplication]keyWindow];
    UIViewController *rootController = [win rootViewController];
    
    [[self view] removeFromSuperview];
    [win addSubview:[rootController view]];
    
}

@end
