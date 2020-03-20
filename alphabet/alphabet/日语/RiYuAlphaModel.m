//
//  RiYuAlphaModel.m
//  Created by beyond on 16/10/31.
//  Copyright © 2016年 beyond. All rights reserved.
//

#import "RiYuAlphaModel.h"

@implementation RiYuAlphaModel
- (NSString *)alpha
{
    return _hiragana;
}
- (NSString *)alpha_mp3
{
    return [NSString stringWithFormat:@"encode_%@",_roma_mp3];
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
    return _hiragana;
}
- (NSString *)menuItem3
{
    return _katakana;
}
- (NSString *)menuItem4
{
    if (_katakana_source.length > 0 && _hiragana_source.length > 0) {
        return [NSString stringWithFormat:@"%@,%@",_katakana_source,_hiragana_source];
    } else {
        return @"";
    }
}
- (NSString *)hongBaoTopStr
{
    return _roma;
}
- (NSString *)hongBaoMiddleStr
{
    return [NSString stringWithFormat:@"%@  %@",_hiragana,_katakana];
}
- (NSString *)hongBaoBottomStr
{
    return [NSString stringWithFormat:@"%@ , %@",_hiragana_source,_katakana_source];
}
@end
