/*!
 @header JKBaseViewModel.h
 
 @abstract viewModel 处理业务逻辑已经请求
 
 @author Created by zhangjikuan on 2016/9/27.
 
 @version 1.00 2016/9/27 Creation
 
 Copyright © 2016年 zhang_jk. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface JKBaseViewModel : NSObject

@property (nonatomic, weak  ) UIViewController *viewController;
@property (nonatomic, strong) NSMutableArray   *dataArrayList;

+ (instancetype)modelWithViewController:(UIViewController *)viewController;

- (instancetype)modelIndexPath:(NSIndexPath *)indexPath;

- (NSUInteger)numberOfSections;

- (NSUInteger)numberOfRowsInSection:(NSUInteger)section;

- (NSUInteger)numberOfItemsInsection:(NSUInteger)section;

- (CGFloat)cellHeightIndexPatch:(NSIndexPath *)index;

- (void)getDataList:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSArray *dataList))success falure:(void(^)(NSError *error))failure;

- (void)getDataListSuccess:(void(^)())success failure:(void(^)())failure;


@end
