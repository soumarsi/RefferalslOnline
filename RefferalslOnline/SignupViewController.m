//
//  SignupViewController.m
//  RefferalslOnline
//
//  Created by anirban on 21/05/15.
//  Copyright (c) 2015 anirban. All rights reserved.
//

#import "SignupViewController.h"
#import "RefferalsOnline-Prefix.pch"
#import "NSString+globalClass.h"
@interface SignupViewController ()<UIAlertViewDelegate>

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

- (IBAction)signup:(id)sender {
    
    if (self.firstName.text == 0 || [self.firstName.text isEqualToString:@""]) {
        
        self.alert = [[UIAlertView alloc]initWithTitle:nil message:@"First name cannot be blank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [self.alert show];
        
    }else if (self.lastName.text == 0 || [self.lastName.text isEqualToString:@""]){
        
        self.alert = [[UIAlertView alloc]initWithTitle:nil message:@"Last name cannot be blank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [self.alert show];
        
    }else if (self.username.text == 0 || [self.username.text isEqualToString:@""]){
        
        self.alert = [[UIAlertView alloc]initWithTitle:nil message:@"Username cannot be blank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [self.alert show];
        
    }else if (self.password.text == 0 || [self.password.text isEqualToString:@""]){
        
        self.alert = [[UIAlertView alloc]initWithTitle:nil message:@"Password cannot be blank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [self.alert show];
        
    }else{
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@app_user_registration?firstname=%@&lastname=%@&email=%@&password=%@",[NSString domain_Url],self.firstName.text,self.lastName.text,self.username.text,self.password.text]];
        NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:url
                                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            
            if(error == nil)
            {
                NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                
                DLog(@"RETURN DATA------> %@",dictionary);
                
                if ([[dictionary objectForKey:@"response"] isEqualToString:@"success"]) {
                    
                    self.alert = [[UIAlertView alloc]initWithTitle:nil message:@"Please check your confirmation mail" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [self.alert show];
                    
                }else{
                    
                    self.alert = [[UIAlertView alloc]initWithTitle:nil message:@"Please check your Username or Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [self.alert show];
                    
                }
            }
            
        }];
        
         [dataTask resume];
        
    }
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == [alertView cancelButtonIndex]){
        //cancel clicked ...do your action
        DLog(@"NO PRESSED---------->");
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SignupViewController *navTo = [storyboard instantiateViewControllerWithIdentifier:@"login"];
        [self.navigationController pushViewController:navTo animated:NO];
        
    }
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
@end
