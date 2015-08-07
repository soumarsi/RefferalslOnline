//
//  LoginViewController.m
//  RefferalslOnline
//
//  Created by anirban on 21/05/15.
//  Copyright (c) 2015 anirban. All rights reserved.
//

#import "LoginViewController.h"
#import "RefferalsOnline-Prefix.pch"
#import "NSString+globalClass.h"
@interface LoginViewController ()
@property (nonatomic, strong) AppDelegate *appDelegate;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleFBSessionStateChangeWithNotification:) name:@"SessionStateChangeNotification" object:nil];
    
    
    // Do any additional setup after loading the view.
}



-(void)handleFBSessionStateChangeWithNotification:(NSNotification *)notification{
    // Get the session, state and error values from the notification's userInfo dictionary.
    NSDictionary *userInfo = [notification userInfo];
    
    FBSessionState sessionState = [[userInfo objectForKey:@"state"] integerValue];
    NSError *error = [userInfo objectForKey:@"error"];
    NSLog(@"session %lu",(unsigned long)sessionState);
    
    
    // Handle the session state.
    // Usually, the only interesting states are the opened session, the closed session and the failed login.
    if (!error) {
        // In case that there's not any error, then check if the session opened or closed.
        if (sessionState == FBSessionStateOpen) {
            // The session is open. Get the user information and update the UI.
            [FBRequestConnection startWithGraphPath:@"me"
                                         parameters:@{@"fields": @"first_name, last_name, picture.type(normal), email"}
                                         HTTPMethod:@"GET"
                                  completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                                      if (!error) {
                                          // Set the use full name.
                                          
                                          NSLog(@"result.....%@",result);
                                          DashBoardViewController *home=[[UIStoryboard storyboardWithName:@"Main" bundle:Nil]instantiateViewControllerWithIdentifier:@"dashboard"];
                                          
                                          [self.navigationController pushViewController:home animated:YES];
                                      }
                                      else{
                                          NSLog(@"%@", [error localizedDescription]);
                                      }
                                  }];
            
           
        }
        else if (sessionState == FBSessionStateClosed || sessionState == FBSessionStateClosedLoginFailed){
            
        }
    }
    else{
        // In case an error has occurred, then just log the error and update the UI accordingly.
        NSLog(@"Error: %@", [error localizedDescription]);
        
        
    }
}

-(void)openActiveSessionWithPermissions:(NSArray *)permissions allowLoginUI:(BOOL)allowLoginUI{
    [FBSession openActiveSessionWithReadPermissions:permissions
                                       allowLoginUI:allowLoginUI
                                  completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
                                      
                                      // Create a NSDictionary object and set the parameter values.
                                      NSDictionary *sessionStateInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                                                        session, @"session",
                                                                        [NSNumber numberWithInteger:status], @"state",
                                                                        error, @"error",
                                                                        nil];
                                      
                                      // Create a new notification, add the sessionStateInfo dictionary to it and post it.
                                      [[NSNotificationCenter defaultCenter] postNotificationName:@"SessionStateChangeNotification"
                                                                                          object:nil
                                                                                        userInfo:sessionStateInfo];
                                      
                                  }];
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

- (IBAction)goSignin:(id)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *dest = [storyboard instantiateViewControllerWithIdentifier:@"signup"];
    [self.navigationController pushViewController:dest animated:NO];
}

- (IBAction)goback:(id)sender {
    
    [self.navigationController popViewControllerAnimated:NO];
}

- (IBAction)login:(id)sender {
    
    DLog(@"LOGIN BUTTON PRESSED");
    
    if (self.username.text == 0 || [self.username.text isEqualToString: @""]){
        
        self.alert = [[UIAlertView alloc]initWithTitle:nil message:@"Please give username" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [self.alert show];
        
        
    }else if(self.password.text == 0 || [self.password.text isEqualToString:@""]) {
        
        self.alert = [[UIAlertView alloc]initWithTitle:nil message:@"Please give password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [self.alert show];
        
    }else{
        
        //--------------- GET Method-----------  //
        
        NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
        
        NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%@email=%@&password=%@",[NSString login_Url],self.username.text,self.password.text]];
        
        NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:url
                                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                            if(error == nil)
                                                            {
                                                                NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                                                
                                                                DLog(@"RETURN DATA------> %@",dictionary);
                                                                
                                                                if ([[dictionary objectForKey:@"response"] isEqualToString:@"success"]) {
                                                                    
                                                                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                                    LoginViewController *dest = [storyboard instantiateViewControllerWithIdentifier:@"dashboard"];
                                                                    [self.navigationController pushViewController:dest animated:NO];

                                                                }else{
                                                                    
                                                                    self.alert = [[UIAlertView alloc]initWithTitle:nil message:@"Please check your Username or Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                                                                    
                                                                    [self.alert show];
                                                                    
                                                                }
                                                            }
                                                            
                                                        }];
        
        [dataTask resume];
        
    }
    
}





- (IBAction)FbLogin:(id)sender
{
   
    if ([FBSession activeSession].state != FBSessionStateOpen &&
        [FBSession activeSession].state != FBSessionStateOpenTokenExtended) {
        
  [self.appDelegate openActiveSessionWithPermissions:@[@"public_profile", @"email"] allowLoginUI:YES];
       
    }
//    else{
//        // Close an existing session.
//        [[FBSession activeSession] closeAndClearTokenInformation];
//        
//            }

    
}









- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
@end
