//
//  MovieListManager.h
//  BaseProject
//
//  Created by amateur on 9/8/15.
//  Copyright © 2015 XA. All rights reserved.
//

#import "BaseAPIManager.h"

@interface MovieListManager : BaseAPIManager<BaseAPIManagerParseDataProtocol>

- (void)getMovieList;

@end
