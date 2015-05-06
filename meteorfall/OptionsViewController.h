//
//  OptionsViewController.h
//  MeteorFall
//
//  Created by iOS Developer on 2015-03-11.
//  Copyright (c) 2015 UPEI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptionsViewController : UIViewController

//Current Skin
@property UIViewController *currViewController;//to change view

//Difficulty Button Outlets
@property (weak, nonatomic) IBOutlet UIButton *easyButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *mediumButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *hardButtonOutlet;

//Option Buttons
- (IBAction)skinsButtonAction:(id)sender;
- (IBAction)backButtonAction:(id)sender;
- (IBAction)mediumButtonAction:(id)sender;
- (IBAction)easyButtonAction:(id)sender;
- (IBAction)hardButtonAction:(id)sender;
- (IBAction)resetButtonAction:(id)sender;

@end
