/*!
 @header UITableViewCell+Extension.h
 
 @abstract  tableviewCell的扩展
 @author Created by zhangjikuan on 2016/9/27.
 
 @version 1.00 2016/9/27 Creation
 
 Copyright © 2016年 zhang_jk. All rights reserved.
 */
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
