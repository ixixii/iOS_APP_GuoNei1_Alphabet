//
//  DetailViewController.h
//  tmp
//
//  Created by beyond on 2020/03/16.
//  Copyright © 2020 beyond. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDate *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

