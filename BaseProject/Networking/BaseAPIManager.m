//
//  BaseAPIManager.m
//  BaseProject
//
//  Created by amateur on 9/7/15.
//  Copyright © 2015 XA. All rights reserved.
//

#import "BaseAPIManager.h"
#import "AFHTTPRequestOperationManager.h"
#import "BaseAPI.h"


@interface BaseAPIManager ()

@property (nonatomic, strong)AFHTTPRequestOperationManager *requestManager;
@property (nonatomic, weak) id<BaseAPIManagerParseDataProtocol>childDelegate;

@end

@implementation BaseAPIManager

- (instancetype)init
{
    self = [self initWithBaseUrlString:kBaseUrlString];
    return self;
}

- (instancetype)initWithBaseUrlString :(NSString *)baseUrlString
{
    self = [super init];
    if (self) {
        if (![self conformsToProtocol:@protocol(BaseAPIManagerParseDataProtocol)]) {
            NSAssert(NO, @"child class must implement this protocol");
        } else
        {
            self.childDelegate = (id<BaseAPIManagerParseDataProtocol>)self;
        }
        
        _requestManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:baseUrlString]];
        _requestManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];
        _errorMessage = nil;
    }
    return self;
}

- (void)sendRequestWithAPI: (BaseAPI *)baseApi
{
    __weak typeof(&*self) weakSelf = self;
    switch (baseApi.APIMethodType) {
        case BaseAPIMethodDelete:
        {
            [_requestManager DELETE:baseApi.APIPath parameters:baseApi.APIParameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                __weak typeof(*&self) strongSelf = weakSelf;
                [strongSelf successOnCallAPI:baseApi withResponseObject:responseObject];
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                __weak typeof(*&self) strongSelf = weakSelf;
                [strongSelf failedOnCallAPI:baseApi withError:error];
            }];
        }
            break;
        case BaseAPIMethodPut:
        {
            [_requestManager PUT:baseApi.APIPath parameters:baseApi.APIParameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                __weak typeof(*&self) strongSelf = weakSelf;
                [strongSelf successOnCallAPI:baseApi withResponseObject:responseObject];
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
               
                __weak typeof(*&self) strongSelf = weakSelf;
                [strongSelf failedOnCallAPI:baseApi withError:error];
            }];
        }
            
            break;
        case BaseAPIMethodGet:
        {

            [_requestManager GET:baseApi.APIPath parameters:baseApi.APIParameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                __weak typeof(*&self) strongSelf = weakSelf;
                [strongSelf successOnCallAPI:baseApi withResponseObject:responseObject];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                __weak typeof(*&self) strongSelf = weakSelf;
                [strongSelf failedOnCallAPI:baseApi withError:error];
                
            }];
        }
            
            break;
        case BaseAPIMethodPost:
        {
            [_requestManager POST:baseApi.APIPath parameters:baseApi.APIParameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                __weak typeof(*&self) strongSelf = weakSelf;
                [strongSelf successOnCallAPI:baseApi withResponseObject:responseObject];
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                __weak typeof(*&self) strongSelf = weakSelf;
                [strongSelf failedOnCallAPI:baseApi withError:error];
            }];
            
        }
            break;
            
        default:
            break;
    }
}

- (void)successOnCallAPI :(BaseAPI *)baseApi withResponseObject:(id)responseObj
{
    NSArray *array = [responseObj objectForKey:@"subjects"];
    
    for (int i=0;i<array.count;i++)
    {
        NSDictionary *dic = array[i];
        
      NSArray *pictures =  [dic objectForKey:@"casts"] ;
        
        for (int j=0; j<pictures.count; j++) {
            NSDictionary *dict = pictures[j];
        
            NSString *name = [dict objectForKey:@"name"];
          NSString *medium =   [[dict objectForKey:@"avatars"] objectForKey:@"medium"];
            NSLog(@"%@",medium);
            NSLog(@"%@",name);
            
        }
        
    }
    
}

- (void)failedOnCallAPI :(BaseAPI *)baseApi withError:(NSError *)error
{
    
}

@end
