//
//  RYFNetworkHttpRequestsManges.h
//  多汇网
//
//  Created by renyufei on 15/6/19.
//  Copyright (c) 2015年 renyufei. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
#import "AFNetworking.h"
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ACRequestMethod){
    RYFRequestMethodGet = 0,
    RYFRequestMethodPost,
    RYFRequestMethodHead,
    RYFRequestMethodPut,
    RYFRequestMethodDelete,
    
};

@interface RYFNetworkHttpRequestsManges : AFHTTPRequestOperationManager
@property (nonatomic,retain) AFHTTPRequestOperationManager *manager;
@property (nonatomic) NSTimeInterval timeOutInt;


- (void)initHttpRequestManges;

/**
 *  检查网络状况
 *
 *  @param state 返回网络状态
 */
- (void)networkState:(void (^)(NSString *state))state;

/**
 *  设置过期时间
 *
 *  @param requestTimeOut 过期时间，以秒为单位
 */
- (void)setrequestTimeOut:(NSTimeInterval)requestTimeOut;

/**
 *  设置HTTP header
 *  以数组形式传入多个参数
 *
 *  @param keys
 *  @param values <#values description#>
 */
- (void)setHeaderByArray:(NSArray *)keys andValues:(NSArray *)values;

/**
 *  设置HTTP Header
 *
 *  @param key   Key For Header
 *  @param value Value For Header
 */

- (void)setHeaderValue:(NSString *)key andValue:(NSString *)value;

/**
 *  下载数据接口
 *
 *  @param downloadURLString 传入的URL
 *  @param method            请求方式
 *  @param parameters        传输的参数
 *  @param passParameters    回调的对象
 *  @param success           成功返回的方法
 *  @param failure           失败返回的方法
 */
- (void)download:(NSString *)downloadURLString andMethod:(NSInteger)method andParameter:(id)parameters andPassParameters:(id)passParameters success:(void (^)(id returnData,id passParameters))success failure:(void (^)(id returnData,NSError *error,id passParameters))failure;


- (void)upload:(NSString *)downloadURLString andMethod:(NSInteger)method andParameter:(id)
    parameters andPassParameters:(id)passParameters andUploadData:(NSData *)uploadData
    dataForKey:(NSString *)dataKey uploadDatafileName:(NSString *)fileName format:(NSString *)
    format
    success:(void(^)(id returnData, id passParameters,id progress))success
    failure:(void(^)(id returnData,NSError *error,id passParameters))failure;
@end
