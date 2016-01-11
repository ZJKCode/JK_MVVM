//
//  JKViewModel.m
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/10.
//  Copyright © 2016年 pactera. All rights reserved.
//

#import "JKViewModel.h"
#import "JKModel.h"
#import "JKHttpTool.h"

@implementation JKViewModel
-(NSUInteger)numberOfRowsInSection:(NSUInteger)section
{
    return self.dataArrayList.count;
}

-(instancetype)modelIndexPath:(NSIndexPath *)indexPath
{
    NSObject *obj = self.dataArrayList[indexPath.row];
    JKViewModel *model = (JKViewModel *)obj;
    return model;

}

-(void)getDataList:(NSString *)url
            params:(NSDictionary *)params
           success:(void (^)(NSArray *))success
            falure:(void (^)(NSError *))failure
{

    //网络请求下载数据
//    [JKHttpTool get:url params:params success:^(id json) {
//    
//
//    } failure:^(NSError *error) {
//        
//    }];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (int i = 0; i<10; i++) {
            JKModel *model = [[JKModel alloc] init];
            model.name = [NSString stringWithFormat:@"jk_name is : %d",i+1];
            model.height = 150 + i*5;
            [self.dataArrayList addObject:model];
        }
        if (success) {
            
            success (self.dataArrayList);

        }
        if (failure) {
            failure (nil);

        }
    });
}

-(void)getDataListSuccess:(void (^)())success failure:(void (^)())failure
{

    [self getDataList:nil params:nil success:^(NSArray *dataList) {
        if (success) success();

    } falure:^(NSError *error) {
        if(failure) failure();

    }];
}
@end
