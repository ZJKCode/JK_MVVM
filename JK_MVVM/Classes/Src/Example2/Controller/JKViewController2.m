//
//  JKViewController2.m
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/11.
//  Copyright © 2016年 pactera. All rights reserved.
//

#import "JKViewController2.h"
#import "JKModel2.h"
#import "JKViewModel2.h"
#import "JKCollectionDataDelegate.h"
#import "UICollectionViewCell+Extension.h"


static NSString *const myCellIdentifier = @"JKCollectionCell";

@interface JKViewController2 ()

@property (nonatomic, strong)JKCollectionDataDelegate *collectionHander;
@end

@implementation JKViewController2

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupCollection];
}

- (void)setupCollection
{
    //配置collectionView的每个item
    CollectionViewCellConfigureBlock configureBlock = ^(NSIndexPath *indexPath,JKModel2 *model,UICollectionViewCell *cell){
        
        [cell configure:cell customObj:model indexPath:indexPath];
    } ;
    //设置点击collectionView的每个item做的一些工作
    DidSelectCellBlock cellSelectBlock  =^(NSIndexPath *indexPath, JKModel2 *model){
    
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    //配置collectionView的每个item的size
    CellItemSize cellItemSizeBlock = ^{
        return CGSizeMake(130, 150);
    };
    //配置collectionView的每个item的margin
    CellItemMargin cellItemMarginBlock = ^{
        return UIEdgeInsetsMake(0, 20, 0, 20);
    };
    
    self.collectionHander = [[JKCollectionDataDelegate alloc] initWithSelFriendsDelegate:[[JKViewModel2 alloc] init]
                                                                          cellIdentifier:myCellIdentifier
                                                                    collectionViewLayout:[[UICollectionViewFlowLayout alloc] init] // 可以使用自定义的UICollectionViewLayout
                                                                      configureCellBlock:configureBlock
                                                                       cellItemSizeBlock:cellItemSizeBlock
                                                                     cellItemMarginBlock:cellItemMarginBlock didSelectBlock:cellSelectBlock];
   
    // 设置UICollectionView的delegate和dataSourse为collectionHander
    [self.collectionHander handleCollectionViewDataSourceAndDelegate:self.collection ];
    
    
}
@end
