//
//  InstructViewController.m
//  MeteorFall
//
//  Created by iOS Developer on 2015-03-11.
//  Copyright (c) 2015 UPEI. All rights reserved.
//

#import "InstructViewController.h"

@interface InstructViewController ()

@end

@implementation InstructViewController

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
//For scroll views text view
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
//Back button action
- (IBAction)backButtonAction:(id)sender {
    UIWindow *win = [[UIApplication sharedApplication]keyWindow];
    UIViewController *rootController = [win rootViewController];
    
    [[self view] removeFromSuperview];
    [win addSubview:[rootController view]];
    
}
@end
