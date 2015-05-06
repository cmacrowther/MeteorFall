//
//  AboutViewController.m
//  MeteorFall
//
//  Created by iOS Developer on 2015-03-11.
//  Copyright (c) 2015 UPEI. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
//Back Button Action
- (IBAction)backButtonAction:(id)sender {
    UIWindow *win = [[UIApplication sharedApplication]keyWindow];
    UIViewController *rootController = [win rootViewController];
    
    [[self view] removeFromSuperview];
    [win addSubview:[rootController view]];
}
@end
