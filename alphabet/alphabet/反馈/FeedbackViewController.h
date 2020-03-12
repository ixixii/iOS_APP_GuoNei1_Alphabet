//
//  FeedbackViewController.h
//  alphabet
//
//  Created by beyond on 2020/03/11.
//  Copyright © 2020 Christine. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FeedbackViewController : UIViewController
//
@property (nonatomic,weak) IBOutlet UITextView *xib_textView;
@property (nonatomic,weak) IBOutlet UILabel *xib_countLabel;

- (IBAction)sendBtnClicked:(UIButton *)sender;
@end

NS_ASSUME_NONNULL_END
