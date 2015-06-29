//
//  SignupViewController.h
//  RefferalslOnline
//
//  Created by anirban on 21/05/15.
//  Copyright (c) 2015 anirban. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController<NSURLSessionDataDelegate,NSURLSessionDelegate,NSURLSessionTaskDelegate>

@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) UIAlertView *alert;

- (IBAction)goLogin:(id)sender;
- (IBAction)goback:(id)sender;
- (IBAction)signup:(id)sender;


@end
