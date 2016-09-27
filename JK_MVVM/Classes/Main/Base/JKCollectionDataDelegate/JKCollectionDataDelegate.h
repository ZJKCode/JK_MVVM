/*!
 @header JKCollectionDataDelegate.h
 
 @abstract  接口适配
 @author Created by zhangjikuan on 2016/9/27.
 
 @version 1.00 2016/9/27 Creation
 
 Copyright © 2016年 zhang_jk. All rights reserved.
 */

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
