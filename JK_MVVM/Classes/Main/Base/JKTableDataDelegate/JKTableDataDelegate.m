//
//  JKTableDataDelegate.m
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/9.
//  Copyright © 2016年 pactera. All rights reserved.
//

#import "JKTableDataDelegate.h"
#import "UITableViewCell+Extension.h"
#import "JKBaseViewModel.h"
#import <MJRefresh/MJRefresh.h>
#import <UITableView+FDTemplateLayoutCell/UITableView+FDTemplateLayoutCell.h>

@interface JKTableDataDelegate ()

@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, copy) CellHeightBlock cellHeightBlock;
@property (nonatomic, copy) DidSelectCellBlock didSelectCellBlock;
@property (nonatomic, strong) JKBaseViewModel *viewModel;
@end

@implementation JKTableDataDelegate


- (id) initWithSelFriendsDelegate:(JKBaseViewModel *)viewModel
                   cellIdentifier:(NSString *)aIdentifier
               configureCellBlock:(TableViewCellConfigureBlock)aConfigCellBlock
                  cellHeightBlock:(CellHeightBlock)aHeightBlock
                   didSelectBlock:(DidSelectCellBlock)didselectBlock
{
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
        self.cellIdentifier = aIdentifier;
        self.cellHeightBlock = aHeightBlock;
        self.didSelectCellBlock = didselectBlock;
        self.configureCellBlock = aConfigCellBlock;
        
    }
    return self;

}

- (void)handelTableViewDatasourceAndDelegate:(UITableView *)table
{
    table.dataSource = self;
    table.delegate = self;
    
    __weak typeof(self) weakSelf = self;
    __weak typeof(table) weakTable = table;
    
    [self.viewModel getDataListSuccess:^{
        [weakTable reloadData];
    } failure:^{
        
    }];
    
    table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.viewModel getDataListSuccess:^{
                [weakTable reloadData];
            } failure:^{
                
            }];
            
            [weakTable.mj_header endRefreshing];
        });
    }];
    

}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.viewModel.dataArrayList[indexPath.row];

}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.viewModel.numberOfSections;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.viewModel  numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (!cell) {
        [UITableViewCell registerTable:tableView nibIdentifier:self.cellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    }
    self.configureCellBlock (indexPath,item,cell);
    return cell;
    
}

#pragma mark 
#pragma mark - delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [UITableViewCell registerTable:tableView nibIdentifier:self.cellIdentifier];
    id item = [self itemAtIndexPath:indexPath];
    __weak typeof(self) weakSelf = self;
    return [tableView fd_heightForCellWithIdentifier:self.cellIdentifier configuration:^(id cell) {
        weakSelf.configureCellBlock(indexPath, item, cell);
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath];
    self.didSelectCellBlock(indexPath,item);
}

@end
