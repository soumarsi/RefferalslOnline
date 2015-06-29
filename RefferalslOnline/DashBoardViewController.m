//
//  DashBoardViewController.m
//  RefferalslOnline
//
//  Created by anirban on 22/05/15.
//  Copyright (c) 2015 anirban. All rights reserved.
//

#import "DashBoardViewController.h"

@interface DashBoardViewController ()<UIScrollViewDelegate>

@end

@implementation DashBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    header *headerView = [header headerview];
    headerView.frame = CGRectMake(0, 0,[[UIScreen mainScreen] bounds].size.width, headerView.frame.size.height);
    [self.mainView addSubview:headerView];
    
    self.divOutline.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"div1"]];
    [_totalscrl setContentSize: CGSizeMake(_totalscrl.frame.size.width, 2000)];
    [_totalscrl setDelegate:self];
    
    
    [self.Recived_button setTitle:@"$50 \nReceived \nrevenue" forState:UIControlStateNormal];
    self.Recived_button.titleLabel.numberOfLines =3;
    self.Recived_button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.Sent_button setTitle:@"$30 \nSent \nreferrals" forState:UIControlStateNormal];
    self.Sent_button.titleLabel.numberOfLines =3;
    self.Sent_button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
