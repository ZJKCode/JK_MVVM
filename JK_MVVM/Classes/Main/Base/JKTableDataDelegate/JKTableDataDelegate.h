//
//  JKTableDataDelegate.h
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/9.
//  Copyright © 2016年 pactera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^TableViewCellConfigureBlock)(NSIndexPath *indexPath,id item, UITableViewCell *cell);
typedef void(^DidSelectCellBlock)(NSIndexPath *indexPath, id item);

typedef CGFloat(^CellHeightBlock)(NSIndexPath *indexPath, id item);


@class JKBaseViewModel;
@interface JKTableDataDelegate : NSObject<UITableViewDataSource,UITableViewDelegate>

- (id) initWithSelFriendsDelegate:(JKBaseViewModel *)viewModel
                   cellIdentifier:(NSString *)aIdentifier
               configureCellBlock:(TableViewCellConfigureBlock)aConfigCellBlock
                  cellHeightBlock:(CellHeightBlock)aHeightBlock
                   didSelectBlock:(DidSelectCellBlock)didselectBlock;

- (void)handelTableViewDatasourceAndDelegate:(UITableView *)table;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
