//
//  header.m
//  RefferalslOnline
//
//  Created by anirban on 22/05/15.
//  Copyright (c) 2015 anirban. All rights reserved.
//

#import "header.h"

@implementation header
+ (id)headerview
{
    header *customView = [[[NSBundle mainBundle] loadNibNamed:@"header" owner:nil options:nil] lastObject];
    
    // make sure customView is not nil or the wrong class!
    if ([customView isKindOfClass:[header class]])
        return customView;
    else
        return nil;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
