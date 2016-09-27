/*!
 @header UIView+Extension.h
 
 @abstract  网络工具类
 @author Created by zhangjikuan on 2016/9/27.
 
 @version 1.00 2016/9/27 Creation
 
 Copyright © 2016年 zhang_jk. All rights reserved.
 */

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
