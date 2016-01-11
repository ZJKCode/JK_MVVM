//
//  UICollectionViewCell+Extension.m
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/11.
//  Copyright © 2016年 pactera. All rights reserved.
//

#import "UICollectionViewCell+Extension.h"

@implementation UICollectionViewCell (Extension)
+ (UINib *)nibWithIdentifier:(NSString *)identifier
{
    return [UINib nibWithNibName:identifier bundle:nil];
}


+ (void)registerCollect:(UICollectionView *)collect
          nibIdentifier:(NSString *)identifier
{
    [collect registerNib:[self nibWithIdentifier:identifier] forCellWithReuseIdentifier:identifier];
}

- (void)configure:(UICollectionViewCell *)cell
        customObj:(id)obj
        indexPath:(NSIndexPath *)indexPath
{
    // rewrite in SubClass

}

+ (CGFloat)getItemHeightWithCustomObj:(id)obj
                            indexPath:(NSIndexPath *)indexPath
{
    // Rewrite this func in SubClass if necessary
    if (!obj) {
        return 0.0f ; // if obj is null .
    }
    return 44.0f ; // default cell height
}
@end
