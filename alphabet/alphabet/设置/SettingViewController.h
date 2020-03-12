//
//  SettingViewController.h
//  alphabet
//
//  Created by beyond on 2020/03/12.
//  Copyright © 2020 Christine. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^BtnClickBlock)(void);
@interface SettingViewController : UIViewController
@property (nonatomic,copy) BtnClickBlock btnClickBlock;
@end

NS_ASSUME_NONNULL_END
