//
//  JKCell.m
//  JK_MVVM
//
//  Created by zhang_jk on 16/1/10.
//  Copyright © 2016年 pactera. All rights reserved.
//

#import "UITableViewCell+Extension.h"
#import "JKCell.h"
#import "JKModel.h"

@implementation JKCell
-(void)configure:(UITableViewCell *)cell customObj:(id)obj indexPath:(NSIndexPath *)indexPath
{

    JKModel *model = (JKModel *)obj;
    self.lbTitle.text = model.name;
    NSString *lengthStr = @"Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS. Writing Swift code is interactive and fun, the syntax is concise yet expressive, and apps run lightning-fast. Swift is ready for your next project — or addition into your current app — because Swift code works side-by-side with Objective-C.";
    NSString *shortStr = @"Swift. A modern programming language that is safe, fast, and interactive.";
    
    self.lbHeight.text = ((indexPath.row) % 2 == 0) ? lengthStr : shortStr;
    self.containtImage.image = ((indexPath.row) % 2 == 0) ? [UIImage imageNamed:@"phil"] : [UIImage imageNamed:@"dogebread"];

}
@end
