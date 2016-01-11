//
//  JKViewController.m
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/10.
//  Copyright © 2016年 pactera. All rights reserved.
//

#import "JKViewController.h"
#import "JKModel.h"
#import "JKCell.h"
#import "JKTableDataDelegate.h"
#import "UITableViewCell+Extension.h"
#import "JKViewModel.h"
#import "JKBaseViewModel.h"
#import "AppDelegate.h"
#import "JKViewController2.h"

static NSString *const MyCellIdentifier = @"JKCell";

@interface JKViewController ()
@property (nonatomic, strong)JKTableDataDelegate *tableHander;

@end

@implementation JKViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self setupTableView];


}

- (void)setupTableView
{
    __weak typeof(self) weakSelf = self;
    
    TableViewCellConfigureBlock configure = ^(NSIndexPath *indexPath,JKModel *obj, UITableViewCell *cell){
        [cell configure:cell customObj:obj indexPath:indexPath];
    
    };
    
    DidSelectCellBlock selectBlock = ^(NSIndexPath *indexPath, JKModel *obj){
        [weakSelf.table deselectRowAtIndexPath:indexPath animated:YES];
        NSLog(@"click row : %@",@(indexPath.row));
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        JKViewController2 *vc = [sb instantiateViewControllerWithIdentifier:@"ViewController2ID"];
        [weakSelf presentViewController:vc
                               animated:YES
                             completion:nil];
        
    };
    
    JKViewModel *model =[[JKViewModel alloc] init];
    
    self.tableHander = [[JKTableDataDelegate alloc] initWithSelFriendsDelegate:model
                                                                cellIdentifier:MyCellIdentifier
                                                            configureCellBlock:configure
                                                               cellHeightBlock:nil
                                                                didSelectBlock:selectBlock];
   
    [self.tableHander handelTableViewDatasourceAndDelegate:_table];
    
    
}
@end
