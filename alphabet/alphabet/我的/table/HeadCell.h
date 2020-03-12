//
//  HeadCell.h
//  alphabet
//
//  Created by beyond on 2020/03/11.
//  Copyright © 2020 Christine. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeadCell : UITableViewCell
+ (instancetype)headCell;
+ (CGFloat )cellHeight;
@property (weak, nonatomic) IBOutlet UIButton *xib_headBtn;
@end

NS_ASSUME_NONNULL_END
