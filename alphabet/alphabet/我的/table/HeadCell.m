//
//  HeadCell.m
//  alphabet
//
//  Created by beyond on 2020/03/11.
//  Copyright © 2020 Christine. All rights reserved.
//

#import "HeadCell.h"

@implementation HeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)headCell
{
    NSArray *tmpArr = [[NSBundle mainBundle]loadNibNamed:@"HeadCell" owner:nil options:nil];
    return tmpArr[0];
}
+ (CGFloat)cellHeight
{
    return 90;
}

@end
