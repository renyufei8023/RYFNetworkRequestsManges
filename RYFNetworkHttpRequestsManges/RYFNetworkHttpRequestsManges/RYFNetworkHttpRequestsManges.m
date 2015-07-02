//
//  RYFNetworkHttpRequestsManges.m
//  多汇网
//
//  Created by renyufei on 15/6/19.
//  Copyright (c) 2015年 renyufei. All rights reserved.
//

#import "RYFNetworkHttpRequestsManges.h"

@implementation RYFNetworkHttpRequestsManges
@synthesize manager;
@synthesize timeOutInt;

- (void)initHttpRequestManges
{
    self.manager = [[AFHTTPRequestOperationManager alloc] init];
    self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
}

- (void)download:(NSString *)downloadURLString andMethod:(NSInteger)method andParameter:(id)parameters andPassParameters:(id)passParameters success:(void (^)(id, id))success failure:(void (^)(id, NSError *, id))failure
{
    self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    if (method == RYFRequestMethodGet) {
        [self.manager GET:downloadURLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success) {
                success(operation,responseObject);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                failure(operation.responseObject,error,passParameters);
            }
        }];
    }
    
    if (method == RYFRequestMethodPost) {
        [self.manager POST:downloadURLString parameters:passParameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success) {
                success(operation,responseObject);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                failure(operation.responseObject,error,passParameters);
            }
        }];
    }
    
    if (method == RYFRequestMethodPut) {
        [self.manager PUT:downloadURLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success) {
                success(operation,responseObject);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                failure(operation.responseObject,error,passParameters);
            }
        }];
    }
    
    if (method == RYFRequestMethodDelete) {
        [self.manager DELETE:downloadURLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success) {
                success(operation,responseObject);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure) {
                failure(operation.responseObject,error,passParameters);
            }
        }];
    }
}

- (void)upload:(NSString *)downloadURLString andMethod:(NSInteger)method andParameter:(id)parameters andPassParameters:(id)passParameters andUploadData:(NSData *)uploadData dataForKey:(NSString *)dataKey uploadDatafileName:(NSString *)fileName format:(NSString *)format success:(void (^)(id, id, id))success failure:(void (^)(id, NSError *, id))failure
{
    if (method == RYFRequestMethodPost) {
        AFHTTPRequestOperation *op = [manager POST:downloadURLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            [formData appendPartWithFileData:uploadData name:dataKey fileName:fileName mimeType:format];
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            success(responseObject,passParameters,operation.responseString);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            failure(operation.responseObject,error,passParameters);

        }];
        [op start];
    }
}

- (void)setrequestTimeOut:(NSTimeInterval)requestTimeOut
{
    [self.manager.requestSerializer setTimeoutInterval:requestTimeOut];
}

- (void)setHeaderValue:(NSString *)key andValue:(NSString *)value
{
    [self.manager.requestSerializer setValue:value forHTTPHeaderField:key];
}

- (void)setHeadrByArray:(NSArray *)keys anValues:(NSArray *)values
{
    for (int i = 0; i<keys.count; i++) {
        [self.manager.requestSerializer setValue:[values objectAtIndex:i] forKey:[keys objectAtIndex:i]];
    }
}


- (void)networkState:(void (^)(NSString *))state
{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                state(@"No NetWork");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                state(@"wifi");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                state(@"3g");
                break;
                
            default:
                state(@"No NetWork");
                break;
        }
    }];
    
}
@end
