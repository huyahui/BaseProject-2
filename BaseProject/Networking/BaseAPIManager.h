//
//  BaseAPIManager.h
//  BaseProject
//
//  Created by amateur on 9/7/15.
//  Copyright © 2015 XA. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseAPI, BaseAPIManager;

@protocol BaseAPIManagerCallBackDelegate <NSObject>

@required

- (void)managerDidSuccess :(BaseAPIManager *)manager;
- (void)managerDidFailed :(BaseAPIManager *)manager;

@end

//parse json data
@protocol BaseAPIManagerParseDataProtocol <NSObject>

- (void)didSuccessParseDataWithResponseObject :(id)responseObj;
- (void)didFailedParseDataWithResponseObject :(NSError *)error;

@end

@interface BaseAPIManager : NSObject

@property (nonatomic, weak) id<BaseAPIManagerCallBackDelegate>delegate;
@property (nonatomic, copy, readonly) NSString *errorMessage;

- (void)sendRequestWithAPI: (BaseAPI *)baseApi;

@end
