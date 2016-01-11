//
//  JKViewModel2.m
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/11.
//  Copyright © 2016年 pactera. All rights reserved.
//

#import "JKViewModel2.h"
#import "JKHttpTool.h"
#import "JKModel2.h"

@implementation JKViewModel2
- (NSUInteger)numberOfItemsInsection:(NSUInteger)section
{
    return self.dataArrayList.count;
    
}

- (void)getDataList:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSArray *))success falure:(void (^)(NSError *))failure
{
    // 进行网络数据下载：将网络数据转换为Model数据类型
//    [JKHttpTool get:url
//             params:params
//            success:^(id json) {
//                
//            } failure:^(NSError *error) {
//                
//            }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (int i = 0; i<10;i++ ) {
            JKModel2 *model = [[JKModel2 alloc] init];
            model.name = [NSString stringWithFormat:@"my name is : %d",i];
            model.height = 150 + i*5;
            [self.dataArrayList addObject:model];
        }
        
        if (success) {
            success(self.dataArrayList);
        }
        
        if (failure) {
            failure(nil);
        }
    });

}

- (void)getDataListSuccess:(void (^)())success failure:(void (^)())failure
{
    // 实际开发中，url 和param 换为自己的值，测试时为nil
    [self getDataList:nil
               params:nil
              success:^(NSArray *dataList) {
                  
                  if (success) {
                      success();
                  }
    
              } falure:^(NSError *error) {
                  if (failure) {
                      failure();
                  }
        
   
              }];

}
@end
