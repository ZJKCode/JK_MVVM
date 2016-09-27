/*!
 @header UICollectionViewCell+Extension.h
 
 @abstract  类别扩展
 @author Created by zhangjikuan on 2016/9/27.
 
 @version 1.00 2016/9/27 Creation
 
 Copyright © 2016年 zhang_jk. All rights reserved.
 */
#import <UIKit/UIKit.h>


@interface UICollectionViewCell (Extension)
/*!
 * 从nib文件中根据重用标识符注册UICollectionViewCell
 *
 */
+ (void)registerCollect:(UICollectionView *)collect
        nibIdentifier:(NSString *)identifier;

/*!
 *  配置UICollectionViewcell，设置UICollectionViewcell内容
 */

- (void)configure:(UICollectionViewCell *)cell
        customObj:(id)obj
        indexPath:(NSIndexPath *)indexPath;

/*!
 * 获取自定义对象Cell的高度
 */

+ (CGFloat)getItemHeightWithCustomObj:(id)obj
                            indexPath:(NSIndexPath *)indexPath;

@end
