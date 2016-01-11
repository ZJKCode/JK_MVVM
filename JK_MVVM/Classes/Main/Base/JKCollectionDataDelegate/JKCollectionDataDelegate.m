//
//  JKCollectDataDelegate.m
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/11.
//  Copyright © 2016年 pactera. All rights reserved.
//

#import "JKCollectionDataDelegate.h"
#import "UICollectionViewCell+Extension.h"
#import "JKBaseViewModel.h"
#import <MJRefresh/MJRefresh.h>

@interface JKCollectionDataDelegate ()<UICollectionViewDelegateFlowLayout>

@property (nonatomic, copy  ) NSString                         *cellIdentifier;
@property (nonatomic, copy  ) CollectionViewCellConfigureBlock aConfigCellBlock;
@property (nonatomic, copy  ) DidSelectCellBlock               didselectBlock;
@property (nonatomic, copy  ) CellItemMargin                   cellItemMargin;
@property (nonatomic, copy  ) CellItemSize                     cellItemSize;
@property (nonatomic, strong) UICollectionViewLayout           *collectionViewLayout;
@property (nonatomic, strong) JKBaseViewModel                  *viewModel;

@end

@implementation JKCollectionDataDelegate

- (id) initWithSelFriendsDelegate:(JKBaseViewModel *)viewModel
                   cellIdentifier:(NSString *)aIdentifier
             collectionViewLayout:(UICollectionViewLayout *)collectionViewLayout
               configureCellBlock:(CollectionViewCellConfigureBlock)aConfigCellBlock
                cellItemSizeBlock:(CellItemSize)cellItemSize
              cellItemMarginBlock:(CellItemMargin)cellItemMargin
                   didSelectBlock:(DidSelectCellBlock)didselectBlock
{

    self = [super init];
    if (self) {
        self.viewModel            = viewModel;
        self.cellIdentifier       = aIdentifier;
        self.collectionViewLayout = collectionViewLayout;
        self.aConfigCellBlock     = aConfigCellBlock;
        self.cellItemSize         = cellItemSize;
        self.cellItemMargin       = cellItemMargin;
        self.didselectBlock       = didselectBlock;
    }
    
    return self;
}

- (id) itemAtIndexPath:(NSIndexPath *)indexPath;
{
    return self.viewModel.dataArrayList[indexPath.item];
}

- (void)handleCollectionViewDataSourceAndDelegate:(UICollectionView *)collection
{
    collection.collectionViewLayout = self.collectionViewLayout;
    collection.backgroundColor = [UIColor whiteColor];
    collection.dataSource = self;
    collection.delegate = self;

    __weak typeof(self) weakSelf = self;
    __weak typeof (collection) weakCollection = collection;
    
    [self.viewModel getDataListSuccess:^{
        [weakCollection reloadData];
    } failure:^{
        
    }];
    
    collection.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{

        //模拟加载数据
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 清空数据
            [weakSelf.viewModel.dataArrayList removeAllObjects];
           
            [weakSelf.viewModel getDataListSuccess:^{
               [weakCollection reloadData];
               NSLog(@" %@",self.viewModel.dataArrayList);
               
           } failure:^{
               
           }];
            
            // 结束刷新
            [weakCollection.mj_header endRefreshing];
        });
        
        collection.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.viewModel getDataListSuccess:^{
                    // 结束刷新
                    [weakCollection.mj_footer endRefreshing];
                    
                    [weakCollection reloadData];
                    NSLog(@" %@",self.viewModel.dataArrayList);
                    
                } failure:^{
                    
                }];
                
            });
   
        }];
    }];

}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个Item大小
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.cellItemSize();
}

// 定义每个UICollectionView的Margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return self.cellItemMargin();

}

// 定义每个UICollection 纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

#pragma mark --UICollectionViewDelegate && UICollectionViewDataSourse
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.viewModel numberOfItemsInsection:section];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath];
    [UICollectionViewCell registerCollect:collectionView nibIdentifier:self.cellIdentifier];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier forIndexPath:indexPath];
    self.aConfigCellBlock(indexPath,item,cell);
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath];
    self.didselectBlock(indexPath,item);
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
@end
