//
//  FYXSNetManager.h
//  FYXSNetManager
//
//  Created by 扶摇先生 on 2018/1/6.
//  Copyright © 2018年 扶摇先生. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^succeeded)(NSInteger status, id response);
typedef void(^failed)(NSInteger status, NSString *error);

@protocol FYXSNetManagerDelegate<NSObject>

- (void)successResultData:(id)response;

- (void)failureResultData:(id)response;
@end

@interface FYXSNetManager : NSObject

@property(nonatomic, weak) id<FYXSNetManagerDelegate> delegate;



/**
 根据域名路径参数签名来请求数据

 @param url 域名
 @param path 路径
 @param params 参数
 @param token 签名
 */
- (void)getDataWithBaseUrl:(NSString *)url path:(NSString *)path params:(NSDictionary *)params token:(NSString *)token;


/**
 根据url来请求数据

 @param url 链接
 */
- (void)getDataWithUrl:(NSString *)url;


/**
 根据url来请求数据

 @param url url
 @param succeeded  成功的回调
 @param failed 失败的回调
 */
- (void)getDataWithUrl:(NSString *)url succeeded:(succeeded)succeeded failed:(failed)failed;

/**
 根据域名路径参数签名来请求数据
 
 @param url 域名
 @param path 路径
 @param params 参数
 @param token 签名
 @param succeeded  成功的回调
 @param failed 失败的回调
 */
- (void)getDataWithBaseUrl:(NSString *)url path:(NSString *)path params:(NSDictionary *)params token:(NSString *)token succeeded:(succeeded)succeeded failed:(failed)failed;

@end
