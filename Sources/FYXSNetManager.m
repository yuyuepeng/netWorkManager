//
//  FYXSNetManager.m
//  FYXSNetManager
//
//  Created by 扶摇先生 on 2018/1/6.
//  Copyright © 2018年 扶摇先生. All rights reserved.
//

#import "FYXSNetManager.h"
#import <UIKit/UIKit.h>
@interface FYXSNetManager()

@property(nonatomic, strong) NSURLSession *session;

@end

@implementation FYXSNetManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _session = [NSURLSession sharedSession];
    }
    return self;
}
- (void)getDataWithBaseUrl:(NSString *)url path:(NSString *)path params:(NSDictionary *)params token:(NSString *)token {
    NSString *baseUrl = [self baseUrl:url path:path parameters:params token:token];
    [self getDataWithUrl:baseUrl];
}

- (void)getDataWithUrl:(NSString *)url {
    NSURL *getDataUrl = [NSURL URLWithString:url];
    NSURLSessionTask *task = [_session dataTaskWithURL:getDataUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            if ([self.delegate respondsToSelector:@selector(failWithError:)]) {
                [self.delegate failureResultData:error];
            }
        }else {
            if ([self.delegate respondsToSelector:@selector(successResultData:)]) {
                id obj = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                [self.delegate successResultData:obj];
            }
        }
    }];
    
    // 启动任务
    [task resume];
}
- (void)getDataWithUrl:(NSString *)url succeeded:(succeeded)succeeded failed:(failed)failed {
    NSURL *getDataUrl = [NSURL URLWithString:url];
    NSURLSessionTask *task = [_session dataTaskWithURL:getDataUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            if (failed) {
                failed(1,@"错误");
            }
            
        }else {
            if (succeeded) {
//                UIImage *image = [UIImage imageWithData:data];
                
                id obj = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                if (obj) {
                    succeeded(0,obj);
                }else {
//                    succeeded(0,image);
                }
            }
        }
    }];
    
    // 启动任务
    [task resume];
}
- (void)getDataWithBaseUrl:(NSString *)url path:(NSString *)path params:(NSDictionary *)params token:(NSString *)token succeeded:(succeeded)succeeded failed:(failed)failed {
    NSString *baseUrl = [self baseUrl:url path:path parameters:params token:token];
    [self getDataWithUrl:baseUrl succeeded:succeeded failed:failed];
}
- (void)postDataWithBaseUrl:(NSString *)url path:(NSString *)path params:(NSDictionary *)params token:(NSString *)token succeeded:(succeeded)succeeded failed:(failed)failed {
    NSString *baseUrl = [self baseUrl:url path:path parameters:nil token:nil];
    

    
}
- (NSString *)baseUrl:(NSString *)baseUrl path:(NSString *)path parameters:(NSDictionary *)parameters token:(NSString *)token {
    NSMutableString *url = [[NSMutableString alloc] initWithFormat:@"%@",baseUrl];
    if (path != nil) {
        [url appendString: path];
    }
    if (parameters != nil) {
        [url appendString:@"?"];
        for (NSString *key in parameters) {
            NSString *value = [parameters valueForKey:key];
            [url appendString:[NSString stringWithFormat:@"%@=%@&", key, value]];
        }
        url = [[NSMutableString alloc]initWithFormat:@"%@",[url substringWithRange:NSMakeRange(0, url.length - 1)]];
    }
    if (token != nil) {
        [url appendString:[NSString stringWithFormat:@"token=%@",token]];
    }
    return url;
}
@end
