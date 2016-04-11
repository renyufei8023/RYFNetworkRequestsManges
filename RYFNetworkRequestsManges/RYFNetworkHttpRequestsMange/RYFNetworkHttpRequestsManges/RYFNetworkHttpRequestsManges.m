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

- (void)download:(NSString *)downloadURLStirng
       andMethod:(NSInteger)method
    andParameter:(id)parameters
andPassParameters:(id)passParameters
         success:(void (^)(id returnData, id passParameters))success
         failure:(void (^)(id returnData , NSError *error ,id passParameters))failure{
    self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    if (method == RYFRequestMethodGet)
    {
        [self.manager GET:downloadURLStirng parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success)
                success(responseObject,passParameters);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (failure)
                failure(operation.responseObject,error,passParameters);
        }];
    }
    
    if (method == RYFRequestMethodPost)
    {
        [self.manager POST:downloadURLStirng parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success)
                success(responseObject,passParameters);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if(failure)
                failure(operation.responseObject,error,passParameters);
        }];
    }
    
    if (method == RYFRequestMethodPut)
    {
        [self.manager PUT:downloadURLStirng parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success)
                success(responseObject,passParameters);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if(failure)
                failure(operation.responseObject,error,passParameters);
        }];
    }
    
    if (method == RYFRequestMethodDelete)
    {
        [self.manager DELETE:downloadURLStirng parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            if (success)
                success(responseObject,passParameters);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if(failure)
                failure(operation.responseObject,error,passParameters);
        }];
    }
}

- (void)upload:(NSString *)uploadURLString
     andMethod:(NSInteger)method
  andParameter:(id)parameters
andPassParameters:(id)passParameters
  andUpladData:(NSData *)uploadData
    dataForKey:(NSString *)dataKey
uploadDatafileName:(NSString *)fileName
        format:(NSString *)format
       success:(void (^)(id returnData, id passParameters,id progress))success
       failure:(void (^)(id returnData , NSError *error ,id passParameters))failure{
    if(method == RYFRequestMethodPost)
    {
        //NSData *imageData = UIImageJPEGRepresentation(self.avatarView.image, 0.5);
        AFHTTPRequestOperation *op = [manager POST:uploadURLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            [formData appendPartWithFileData:uploadData name:dataKey fileName:fileName mimeType:format];
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //NSLog(@"Success: %@ ***** %@", operation.responseString, responseObject);
            success(responseObject,passParameters,operation.responseString);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //NSLog(@"Error: %@ ***** %@", operation.responseString, error);
            failure(operation.responseObject,error,passParameters);
        }];
        [op start];
        
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

- (void)setrequestTimeOut:(NSTimeInterval)requestTimeOut{
    [self.manager.requestSerializer setTimeoutInterval:requestTimeOut];
}

- (void)setHeaderValue:(NSString *)key andValue:(NSString *)value{
    [self.manager.requestSerializer setValue:value forHTTPHeaderField:key];
}

- (void)setHeaderByArray:(NSArray *)keys andValues:(NSArray *)values{
    for (int i=0; i<keys.count; i++)
    {
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
    [manager.reachabilityManager startMonitoring];
}
@end
