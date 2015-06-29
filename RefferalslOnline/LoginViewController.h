//
//  LoginViewController.h
//  RefferalslOnline
//
//  Created by anirban on 21/05/15.
//  Copyright (c) 2015 anirban. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *mainView;
- (IBAction)goSignin:(id)sender;
- (IBAction)goback:(id)sender;
- (IBAction)login:(id)sender;

@end
