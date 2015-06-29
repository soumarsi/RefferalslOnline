////
////  ROGlobalClass.m
////  RefferalslOnline
////
////  Created by Prosenjit Kolay on 29/06/15.
////  Copyright (c) 2015 anirban. All rights reserved.
////
//
//#import "ROGlobalClass.h"
//
//@implementation ROGlobalClass{
//    
//    URLResponseBlock _response;
//    
//}
//-(void)GlobalDict:(NSString *)parameter Withblock:(URLResponseBlock)responce 
//{
//    
//    DLog(@"URL---- %@",parameter);
//    
//    NSError *error;
//    
//    //------- 1: Creating configuration and session ------//
//    
//    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
//    
//    //------- 2: API Firing --------//
//    
//    NSURL *api = [NSURL URLWithString:parameter];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:api
//                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                       timeoutInterval:60.0];
//
//    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setHTTPMethod:@"POST"];
//    
//    NSDictionary *profiledict = @{@"email": [User currentUser].profile_id,@"reported_profile_id":[[NSUserDefaults standardUserDefaults] objectForKey:@"otherProfileId"],@"reason":viewRep.textView.text};
//    
//    NSData *postData = [NSJSONSerialization dataWithJSONObject:profiledict options:0 error:&error];
//    [request setHTTPBody:postData];
//    
//    
//    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
//        
//        
//        
//    }];
//    
//}
//
//@end
