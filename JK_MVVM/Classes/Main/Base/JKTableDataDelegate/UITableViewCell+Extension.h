//
//  UITableViewCell+Extension.h
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/9.
//  Copyright © 2016年 pactera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Extension)

/*!
 *  从nib文件中根据重用标识符注册UITableViewCell
 */

+ (void)registerTable:(UITableView *)table
        nibIdentifier:(NSString *)identifier;

/*!
 *  配置UItableViewCell，设置UItableViewCell的内容
 */
- (void)configure:(UITableViewCell *)cell
        customObj:(id)obj
        indexPath:(NSIndexPath *)indexPath;

/**
 *  获取自定义对象的cell高度 (已集成UITableView+FDTemplateLayoutCell，现在创建的cell自动计算高度)
 */
+ (CGFloat)getCellHeightWithCustomObj:(id)obj
                            indexPath:(NSIndexPath *)indexPath;

@end
