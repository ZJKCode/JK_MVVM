//
//  UICollectionViewCell+Extension.h
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/11.
//  Copyright © 2016年 pactera. All rights reserved.
//

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
