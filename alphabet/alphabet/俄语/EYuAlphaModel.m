//
//  Created by beyond on 16/9/10.
//  Copyright © 2016年 beyond. All rights reserved.
//

#import "EYuAlphaModel.h"

@implementation EYuAlphaModel
- (NSString *)alpha
{
    return _roma;
}

- (NSString *)alpha_mp3
{
    return [NSString stringWithFormat:@"%@.mp3",_roma];
}
- (NSString *)alpha_remark
{
    return _remark;
}
- (NSString *)menuItem1
{
    return _roma;
}
- (NSString *)menuItem2
{
    return _name;
}
- (NSString *)menuItem3
{
    return @"";
}
- (NSString *)menuItem4
{
    return @"";
}
- (NSString *)hongBaoTopStr
{
    return _roma;
}
- (NSString *)hongBaoMiddleStr
{
    return _name;
}
- (NSString *)hongBaoBottomStr
{
    return [_readTip isEqualToString:@"sg31.com"]?@"":_readTip;
}
@end
