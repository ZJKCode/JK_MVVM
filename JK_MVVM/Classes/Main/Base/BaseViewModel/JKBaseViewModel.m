//
//  JKViewModel.m
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/9.
//  Copyright © 2016年 pactera. All rights reserved.
//

#import "JKBaseViewModel.h"

@implementation JKBaseViewModel


-(NSMutableArray *)dataArrayList
{
    if (_dataArrayList == nil) {
        _dataArrayList = [NSMutableArray array];
    }
    return _dataArrayList;
}

+ (instancetype)modelWithViewController:(UIViewController *)viewController
{
    JKBaseViewModel *viewModel = [self new];
    if (viewModel) {
        viewModel.viewController = viewController;
    }
    return viewModel;
    
}

- (instancetype)modelIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (NSUInteger)numberOfSections
{
    return  1;
}

- (NSUInteger)numberOfRowsInSection:(NSUInteger)section
{
    return 0;

}

- (NSUInteger)numberOfItemsInsection:(NSUInteger)section
{

    return 0;
}
- (CGFloat *)cellHeightIndexPatch:(NSIndexPath *)index
{
    return 0;
}

- (void)getDataList:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSArray *dataList))success falure:(void(^)(NSError *error))failure
{

}

- (void)getDataListSuccess:(void(^)())success failure:(void(^)())failure
{

}

-(NSString *)description
{
    return [NSString stringWithFormat:@"View model:%@ viewController:%@",
            super.description,
            self.viewController.description
            ];
}

@end
