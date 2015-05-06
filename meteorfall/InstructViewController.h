//
//  InstructViewController.h
//  MeteorFall
//
//  Created by iOS Developer on 2015-03-11.
//  Copyright (c) 2015 UPEI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstructViewController : UIViewController
- (IBAction)backButtonAction:(id)sender;

//Scroll View
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewOutlet;

//Sub text view
@property (weak, nonatomic) IBOutlet UITextView *subViewOutlet;

@end
