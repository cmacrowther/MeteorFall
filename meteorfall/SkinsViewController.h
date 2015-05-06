//
//  SkinsViewController.h
//  meteorfall
//
//  Created by iOS Developer on 2015-04-02.
//  Copyright (c) 2015 UPEI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkinsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewOutlet; //Scroll view
@property (weak, nonatomic) IBOutlet UIView *subViewOutlet; //subView in scroll view

//Skins images
- (IBAction)skin1Action:(id)sender;
- (IBAction)skin2Action:(id)sender;
- (IBAction)skin3Action:(id)sender;
- (IBAction)skin4Action:(id)sender;
- (IBAction)skin5Action:(id)sender;
- (IBAction)skin6Action:(id)sender;
- (IBAction)backButtonAction:(id)sender;

//Current Skin
@property (weak, nonatomic) IBOutlet UIImageView *currentSkinOutlet;

//Buttons for skins
@property (weak, nonatomic) IBOutlet UIButton *button1Outlet;
@property (weak, nonatomic) IBOutlet UIButton *button2Outlet;
@property (weak, nonatomic) IBOutlet UIButton *button3Outlet;
@property (weak, nonatomic) IBOutlet UIButton *button4Outlet;
@property (weak, nonatomic) IBOutlet UIButton *button5Outlet;
@property (weak, nonatomic) IBOutlet UIButton *button6Outlet;

@end
