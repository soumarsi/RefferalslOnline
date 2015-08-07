//
//  LoginViewController.h
//  RefferalslOnline
//
//  Created by anirban on 21/05/15.
//  Copyright (c) 2015 anirban. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefferalsOnline-Prefix.pch"
#import <FacebookSDK/FacebookSDK.h>
#import "AppDelegate.h"
#import "DashBoardViewController.h"

@interface LoginViewController : UIViewController<UIAlertViewDelegate,NSURLSessionDataDelegate,NSURLSessionDelegate,NSURLSessionTaskDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *mainView;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) UIAlertView *alert;


- (IBAction)goSignin:(id)sender;
- (IBAction)goback:(id)sender;
- (IBAction)login:(id)sender;
- (IBAction)FbLogin:(id)sender;

-(void)openActiveSessionWithPermissions:(NSArray *)permissions allowLoginUI:(BOOL)allowLoginUI;




@end
