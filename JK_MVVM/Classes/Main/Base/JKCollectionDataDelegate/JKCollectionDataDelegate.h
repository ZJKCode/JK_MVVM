//
//  JKCollectDataDelegate.h
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/11.
//  Copyright © 2016年 pactera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/*!
 *  配置UICollectionViewCell的Block
 */
typedef void(^CollectionViewCellConfigureBlock)(NSIndexPath *indexPath,id item,UICollectionViewCell *cell);

/*!
 *  选中UICollectionViewCell的Block
 */
typedef void(^DidSelectCellBlock)(NSIndexPath *indexPath,id item);

/*!
 *  获取UICollectionViewCell大小的Block
 */
typedef CGSize(^CellItemSize)();

/*!
 *  获取UICollectionViewCell间隔Margin的Block
 */
typedef UIEdgeInsets(^CellItemMargin)();

@class JKBaseViewModel;
@interface JKCollectionDataDelegate : NSObject<UICollectionViewDataSource,UICollectionViewDelegate>

//**初始化方法*/
- (id) initWithSelFriendsDelegate:(JKBaseViewModel *)viewModel
                   cellIdentifier:(NSString *)aIdentifier
             collectionViewLayout:(UICollectionViewLayout *)collectionViewLayout
               configureCellBlock:(CollectionViewCellConfigureBlock)aConfigCellBlock
                cellItemSizeBlock:(CellItemSize)cellItemSize
              cellItemMarginBlock:(CellItemMargin)cellItemMargin
                   didSelectBlock:(DidSelectCellBlock)didselectBlock;

/*!
 *  设置CollectionView的DataSource 和 Delegate
 *
 */
- (void)handleCollectionViewDataSourceAndDelegate:(UICollectionView *)collection;

/*!
 *  获取CollectionView中item所在的indexpath
 *
 */
- (id) itemAtIndexPath:(NSIndexPath *)indexPath;

@end
