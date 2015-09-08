//
//  MovieListApi.m
//  BaseProject
//
//  Created by amateur on 9/8/15.
//  Copyright © 2015 XA. All rights reserved.
//

#import "MovieListApi.h"

@implementation MovieListApi

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (NSString *)APIPath
{
    return @"/v2/movie/top250";
}

- (NSDictionary *)APIParameters
{
    return nil;
}

- (BaseAPIMethodType )APIMethodType
{
    return BaseAPIMethodGet;
}

@end
