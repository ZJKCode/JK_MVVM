//
//  UICollectionViewCell+Extension.h
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/11.
//  Copyright © 2016年 pactera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (Extension)

+ (void)registerCollect:(UICollectionView *)collect
        nibIdentifier:(NSString *)identifier;

- (void)configure:(UICollectionViewCell *)cell
        customObj:(id)obj
        indexPath:(NSIndexPath *)indexPath;

+ (CGFloat)getItemHeightWithCustomObj:(id)obj
                            indexPath:(NSIndexPath *)indexPath;

@end
