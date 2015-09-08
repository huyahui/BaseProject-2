//
//  MovieListManager.m
//  BaseProject
//
//  Created by amateur on 9/8/15.
//  Copyright © 2015 XA. All rights reserved.
//

#import "MovieListManager.h"
#import "MovieListApi.h"
@implementation MovieListManager

- (void)getMovieList
{
    MovieListApi *movieApi = [[MovieListApi alloc]init];
    
    [self sendRequestWithAPI:movieApi];
}

- (void)didSuccessParseDataWithResponseObject :(id)responseObj
{
    
}
- (void)didFailedParseDataWithResponseObject :(NSError *)error
{
    
}


@end
