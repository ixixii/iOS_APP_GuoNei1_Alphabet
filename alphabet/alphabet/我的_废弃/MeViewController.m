//
//  MeViewController.m
//  koreanalphabet
//
//  Created by beyond on 2020/03/01.
//  Copyright © 2020 Christine. All rights reserved.
//

#import "MeViewController.h"
#import "MeHeaderView.h"
#import "MeCellView.h"
#import "UIView+Frame.h"

#import "AboutController.h"

#define kColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ScreenBounds [UIScreen mainScreen].bounds
#define ScreenWidth ScreenBounds.size.width
#define ScreenHeight ScreenBounds.size.height

@interface MeViewController ()
{
    MeCellView *_cell1;
}
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addHeaderView2];
    [self addHeaderView3];
    [self addHeaderView];
}
- (void)addHeaderView
{
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor clearColor];
    UIView *bgView =  [[UIView alloc]init];
    bgView.backgroundColor = kColor(85, 92, 92);
    bgView.alpha = 0.55;
    bgView.frame = CGRectMake(0, 0, ScreenWidth, 65);
    [headerView addSubview:bgView];
    headerView.frame = CGRectMake(0, 0, ScreenWidth, 65);
    [self.view addSubview:headerView];
    
    // appName
    UILabel *classLable = [[UILabel alloc]init];
    // 添加tap手势
    UITapGestureRecognizer *tapReco = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissCtrl)];
    classLable.userInteractionEnabled = YES;
    [classLable addGestureRecognizer:tapReco];
    
    classLable.text = @"我的";
    classLable.font = [UIFont boldSystemFontOfSize:24.0];
    classLable.textAlignment = NSTextAlignmentCenter;
    classLable.textColor = kColor(240, 240, 240);
    classLable.backgroundColor = [UIColor clearColor];
    classLable.frame = CGRectMake(40, 20, ScreenWidth - 80, 45);
    [headerView addSubview:classLable];
    
}
// -------------------
- (void)addHeaderView2
{
    MeHeaderView *headerView = [MeHeaderView meHeaderView];
    headerView.y = 20;
    [self.view addSubview:headerView];
    
    MeCellView *cellView1 = [MeCellView meCellView];
    cellView1.y = CGRectGetMaxY(headerView.frame);
    cellView1.width = [UIScreen mainScreen].bounds.size.width;
    cellView1.label.text = @"点击登陆";
    cellView1.imgView.image = [UIImage imageNamed:@"about.png"];
    [cellView1.btn addTarget:self action:@selector(aboutBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cellView1];
    _cell1 = cellView1;
}
- (void)aboutBtnClicked
{
    AboutController *ctrl = [[AboutController alloc]init];
    [self presentViewController:ctrl animated:YES completion:nil];
}
// -------------------
- (void)addHeaderView3
{
    MeCellView *cellView2 = [MeCellView meCellView];
    cellView2.y = CGRectGetMaxY(_cell1.frame);
    cellView2.width = [UIScreen mainScreen].bounds.size.width;
    cellView2.label.text = @"点击登陆";
    cellView2.imgView.image = [UIImage imageNamed:@"about.png"];
    [cellView2.btn addTarget:self action:@selector(cell2BtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cellView2];
}
- (void)cell2BtnClicked
{
    AboutController *ctrl = [[AboutController alloc]init];
    [self presentViewController:ctrl animated:YES completion:nil];
}

@end
