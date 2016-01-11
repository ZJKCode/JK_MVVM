//
//  JKCollectionCell.m
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/11.
//  Copyright © 2016年 pactera. All rights reserved.
//

#import "JKCollectionCell.h"
#import "UICollectionViewCell+Extension.h"
#import "JKModel2.h"

@implementation JKCollectionCell

-(void)configure:(UICollectionViewCell *)cell customObj:(id)obj indexPath:(NSIndexPath *)indexPath
{
    
    JKModel2 *model = (JKModel2 *)obj;
    JKCollectionCell *mycell = (JKCollectionCell *)cell ;
    mycell.lbTitle.text = model.name;
    mycell.lbHeight.text = @"Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS. " ;

}

- (void)awakeFromNib {
    // Initialization code
    self.layer.borderColor = [UIColor colorWithRed:0.461 green:0.594 blue:1.000 alpha:1.000].CGColor;
    self.layer.borderWidth = 2.0;
    self.layer.cornerRadius = 5.0;
}

@end
