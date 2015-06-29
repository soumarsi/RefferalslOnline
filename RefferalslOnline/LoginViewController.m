//
//  LoginViewController.m
//  RefferalslOnline
//
//  Created by anirban on 21/05/15.
//  Copyright (c) 2015 anirban. All rights reserved.
//

#import "LoginViewController.h"
#import "RefferalsOnline-Prefix.pch"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
        
//        --------------- GET Method-----------  //
        
        NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
        
        NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%@email=%@&password=%@",Login_Url,self.username.text,self.password.text]];
        
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
        
        //---------------- POST Method-------------//
        
//        NSError *error;
//        
//        //------- 1: Creating configuration and session ------//
//        
//        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
//        NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
//        
//        //------- 2: API Firing --------//
//        
//        NSURL *api = [NSURL URLWithString:[NSString stringWithFormat:@"http://esolz.co.in/lab6/Referralonline/login/verify_app_login?"]];
//        
//        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:api
//                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                           timeoutInterval:60.0];
//        
//        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
//        [request setHTTPMethod:@"PUT"];
//        
//        //-------- 3: Appending data & getting response -------//
//        
//        NSDictionary *loginData = [[NSDictionary alloc] initWithObjectsAndKeys: @"email", self.username.text,
//                                 @"password", self.password.text,
//                                 nil];
//        NSData *postData = [NSJSONSerialization dataWithJSONObject:loginData options:0 error:&error];
//        [request setHTTPBody:postData];
//        
//        
//        if (!error) {
//        
//        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//            
//            DLog(@"RESPONSE-------> %@",response);
//            DLog(@"DATA RETURN---->%@",data);
//            
//            
//        }];
//        
//        [postDataTask resume];
//            
//        }
        
        //------------------- :::: -------------------//
        
        
    }
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
@end
