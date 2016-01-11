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


+ (void)get:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure;

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure;

+ (void)showExceptionDialog;

@end
