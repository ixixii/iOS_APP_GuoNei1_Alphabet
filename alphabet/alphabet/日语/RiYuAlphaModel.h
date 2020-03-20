//
//  RiYuAlphaModel.h
//  Created by beyond on 16/10/31.
//  Copyright © 2016年 beyond. All rights reserved.
//

#import "AlphaModel.h"

@interface RiYuAlphaModel : AlphaModel
// 罗马
@property (nonatomic,copy) NSString *roma;
// 音频
@property (nonatomic,copy) NSString *roma_mp3;
// 平假名
@property (nonatomic,copy) NSString *hiragana;
// 平假名来源
@property (nonatomic,copy) NSString *hiragana_source;
// 片假名
@property (nonatomic,copy) NSString *katakana;
// 片假名来源
@property (nonatomic,copy) NSString *katakana_source;

// 备注
@property (nonatomic,copy) NSString *remark;

@end
