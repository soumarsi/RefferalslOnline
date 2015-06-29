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
//    Urlresponceblock _responce;
//    
//}
//-(void)GlobalDict:(NSString *)parameter Withblock:(Urlresponceblock)responce
//{
//    
//    DLog(@"URL---- %@",parameter);
//    
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    
//    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
//    
//    NSURL *url = [NSURL URLWithString:parameter];
//    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:url
//                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//                                                        
////                                                        if(error == nil)
////                                                        {
////                                                            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
////    
////                                                        }
//                                                    }];
//    
//    [dataTask resume];
//    
//    _responce=[responce copy];
//    
//}
//- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response
//{
//    dictionary = [[NSDictionary alloc]init];
//}
//- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data
//{
////    [dictionary appendData:data];
//}
//- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
//{
//    NSLog(@"Did Fail");
//}
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection
//{
//    //   id result=[NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:nil];
//    //   _responce(result,nil);
//    
//        DLog(@"GLOBAL CLASS ELSE------");
//        id result=[NSJSONSerialization JSONObjectWithData:dictionary options:kNilOptions error:nil];
//        _responce(result,nil);
//        
//    
//}
//
//
//@end
