//
//  LoginViewCtrl.h
//  passwordmanagement
//
//  Created by beyond on 2019/09/08.
//  Copyright © 2019 beyond. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^BtnClickBlock)(void);

@interface LoginViewCtrl : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *xib_textField_username;
@property (weak, nonatomic) IBOutlet UITextField *xib_textField_password;
- (IBAction)privacyBtnClicked:(UIButton *)sender;

@property (nonatomic,copy) BtnClickBlock btnClickBlock;
@end

NS_ASSUME_NONNULL_END
