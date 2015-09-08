//
//  BaseAPI.m
//  BaseProject
//
//  Created by amateur on 9/7/15.
//  Copyright © 2015 XA. All rights reserved.
//

#import "BaseAPI.h"

@implementation BaseAPI

- (BaseAPIMethodType)APIMethodType
{
    return BaseAPIMethodPost;
}

- (NSString *)APIPath
{
    return nil;
}

- (NSDictionary *)APIParameters
{
    return nil;
}

@end
