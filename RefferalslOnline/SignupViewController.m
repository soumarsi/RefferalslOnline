//
//  SignupViewController.m
//  RefferalslOnline
//
//  Created by anirban on 21/05/15.
//  Copyright (c) 2015 anirban. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController ()

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)goLogin:(id)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SignupViewController *dest = [storyboard instantiateViewControllerWithIdentifier:@"login"];
    [self.navigationController pushViewController:dest animated:NO];
}

- (IBAction)goback:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:NO];
}
@end
