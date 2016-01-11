//
//  JKViewModel.h
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/9.
//  Copyright © 2016年 pactera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface JKBaseViewModel : NSObject

@property (nonatomic, weak)UIViewController *viewController;
@property (nonatomic, strong)NSMutableArray *dataArrayList;

+ (instancetype)modelWithViewController:(UIViewController *)viewController;

- (instancetype)modelIndexPath:(NSIndexPath *)indexPath;

- (NSUInteger)numberOfSections;

- (NSUInteger)numberOfRowsInSection:(NSUInteger)section;

- (NSUInteger)numberOfItemsInsection:(NSUInteger)section;

- (void)getDataList:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSArray *dataList))success falure:(void(^)(NSError *error))failure;

- (void)getDataListSuccess:(void(^)())success failure:(void(^)())failure;


@end
