//
//  BaseAPI.h
//  BaseProject
//
//  Created by amateur on 9/7/15.
//  Copyright © 2015 XA. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    
    BaseAPIMethodPut = 1,
    BaseAPIMethodDelete,
    BaseAPIMethodPost,
    BaseAPIMethodGet
    
} BaseAPIMethodType;

@interface BaseAPI : NSObject

@property (nonatomic, readonly) BaseAPIMethodType APIMethodType;
@property (nonatomic, readonly,copy) NSString *APIPath;
@property (nonatomic, readonly,copy) NSDictionary *APIParameters;

@end
