//
//  SGTableViewCell.m
//  alphabet
//
//  Created by beyond on 2020/03/11.
//  Copyright © 2020 Christine. All rights reserved.
//

#import "SGTableViewCell.h"

@implementation SGTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)tableViewCell
{
    NSArray *tmpArr = [[NSBundle mainBundle]loadNibNamed:@"SGTableViewCell" owner:nil options:nil];
    return tmpArr[0];
}
@end
