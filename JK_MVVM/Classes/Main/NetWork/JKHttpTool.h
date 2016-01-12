//
//  JKHttpTool.h
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/9.
//  Copyright © 2016年 pactera. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^HttpSuccess)(id json);
typedef void(^HttpFailure)(NSError *error);


@interface JKHttpTool : NSObject

+ (JKHttpTool *)defaultJKHttpTool;

/*!
 *  get请求
 *
 *  @param url     url
 *  @param params  params
 *  @param success success
 *  @param failure failure
 */
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure;

/*!
 *  post请求
 *
 *  @param url     url
 *  @param params  params
 *  @param success success
 *  @param failure failure
 */
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure;

/*!
 *  网络异常
 */
+ (void)showExceptionDialog;

@end
