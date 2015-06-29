//
//  ViewController.m
//  RefferalslOnline
//
//  Created by anirban on 21/05/15.
//  Copyright (c) 2015 anirban. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SignUp:(id)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *dest = [storyboard instantiateViewControllerWithIdentifier:@"signup"];
    [self.navigationController pushViewController:dest animated:NO];
}


- (IBAction)loginNew:(id)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *dest = [storyboard instantiateViewControllerWithIdentifier:@"login"];
    [self.navigationController pushViewController:dest animated:NO];
    
}
@end
