//
//  JKHttpTool.m
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/9.
//  Copyright © 2016年 pactera. All rights reserved.
//


#import "JKHttpTool.h"
#import <AFNetworking/AFNetworking.h>
#import "AppDelegate.h"

@interface JKHttpTool ()
@property (nonatomic, strong)AFHTTPSessionManager *manager;
@end

@implementation JKHttpTool

- (instancetype)init
{
    self = [super init];
    if (self) {
        //创建请求管理者
        self.manager = [AFHTTPSessionManager manager];
        //请求参数序列化
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
        //设置contenType;
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        
    }
    return self;
}

+ (JKHttpTool *)defaultJKHttpTool
{
    static JKHttpTool *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure{
    if ([AFNetworkReachabilityManager manager].isReachable) {
        // 发送请求
        [[JKHttpTool defaultJKHttpTool].manager GET:url
                                         parameters:params
                                           progress:nil
                                            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           
                                                if (success) success(responseObject);
            
                                            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
           
                                                if (failure) failure (error);
            
       
                                            }];
        
   
    } else {
       
        [JKHttpTool showExceptionDialog];
    }
    

}

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure{
    if ([AFNetworkReachabilityManager manager].reachable) {
        [[JKHttpTool defaultJKHttpTool].manager POST:url
                                          parameters:params
                                            progress:nil
                                             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
                                                 if (success) success(responseObject);
            
       
                                             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          
                                                 if (failure) failure(error);
       
                                             }];
   
    }else {
        [JKHttpTool showExceptionDialog];
    }

}

+ (void)showExceptionDialog
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [[[UIAlertView alloc] initWithTitle:@"提示"
                                message:@"网络异常，请检查网络链接"
                               delegate:nil
                      cancelButtonTitle:@"确定"
                      otherButtonTitles:nil, nil] show];
#pragma clang diagnostic pop

    
}
@end
