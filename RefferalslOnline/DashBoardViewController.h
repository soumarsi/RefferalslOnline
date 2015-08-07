//
//  DashBoardViewController.h
//  RefferalslOnline
//
//  Created by anirban on 22/05/15.
//  Copyright (c) 2015 anirban. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "header.h"
@interface DashBoardViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIView *divOutline;
@property (weak, nonatomic) IBOutlet UIScrollView *totalscrl;
@property (weak, nonatomic) IBOutlet UIButton *Recived_button;
@property (weak, nonatomic) IBOutlet UIButton *Sent_button;

@end
