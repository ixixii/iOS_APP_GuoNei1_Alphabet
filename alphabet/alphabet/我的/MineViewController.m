//
//  MineViewController.m
//  alphabet
//
//  Created by beyond on 2020/03/11.
//  Copyright © 2020 Christine. All rights reserved.
//

#import "MineViewController.h"
#import "SGTableViewCell.h"
#import "HeadCell.h"
#import "LoginViewCtrl.h"
#import "FeedbackViewController.h"
#import "MBProgressHUD+NJ.h"
#import "SettingViewController.h"

#define kColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ScreenBounds [UIScreen mainScreen].bounds
#define ScreenWidth ScreenBounds.size.width
#define ScreenHeight ScreenBounds.size.height

@interface MineViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_modelArr;
    HeadCell *_headerCell;
}
@end

@implementation MineViewController
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *username = [userDefault objectForKey:@"userDefault_username"];
    if(username.length > 0){
        [_headerCell.xib_headBtn setTitle:username forState:UIControlStateNormal];
        _headerCell.xib_headBtn.userInteractionEnabled = false;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏文字和字体
    self.navigationItem.title = @"我的";
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:24],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self addTableView];
    
    _modelArr = @[
        @{
            @"icon": @"kefu.png", // 90px -> @3x
            @"title": @"客服电话"
        },
        @{
            @"icon": @"feedback.png",
            @"title": @"意见反馈"
        },
        @{
            @"icon": @"cache.png",
            @"title": @"清理缓存"
        },
        @{
            @"icon": @"setting.png",
            @"title": @"设置"
        }
    ];
}

- (void)addTableView
{
    CGRect frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    UITableView *tableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView = tableView;
}
#pragma mark - tableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sgtableviewcellid"];
    if(indexPath.row == 0){
        HeadCell *headerCell = [HeadCell headCell];
        [headerCell.xib_headBtn addTarget:self action:@selector(headBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        headerCell.selectionStyle = UITableViewCellSeparatorStyleNone;
        _headerCell = headerCell;
        return headerCell;
    }else{
        if (cell == nil) {
            cell = [SGTableViewCell tableViewCell];
        }
        cell.textLabel.numberOfLines = 0;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        NSDictionary *model = [_modelArr objectAtIndex:indexPath.row - 1];
        cell.imageView.image = [UIImage imageNamed:[model objectForKey:@"icon"]];
        cell.textLabel.text = [model objectForKey:@"title"];
        return cell;
    }
}
// 点击登陆
- (void)headBtnClicked
{
    LoginViewCtrl *ctrl = [[LoginViewCtrl alloc]init];
    ctrl.btnClickBlock = ^(){
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        NSString *username = [userDefault objectForKey:@"userDefault_username"];
        if(username.length > 0){
            [_headerCell.xib_headBtn setTitle:username forState:UIControlStateNormal];
            _headerCell.xib_headBtn.userInteractionEnabled = false;
        }
    };
    [self.navigationController presentViewController:ctrl animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        return 189;
    }else{
        return 44;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            {
                NSLog(@"sg__0");
            }
            break;
        case 1:
        {
            NSLog(@"sg__1__客服");
            NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"16675565267"];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        }
        break;
        case 2:
        {
            NSLog(@"sg__2__意见反馈");
            FeedbackViewController *ctrl = [[FeedbackViewController alloc]init];
            [self.navigationController pushViewController:ctrl animated:YES];
        }
        break;
        case 3:
        {
            NSLog(@"sg__3__清理缓存");
            [MBProgressHUD showSuccess:@"缓存清理成功！"];
        }
        break;
        case 4:
        {
            NSLog(@"sg__4__设置");
            SettingViewController *ctrl = [[SettingViewController alloc]init];
            ctrl.btnClickBlock = ^{
                [_headerCell.xib_headBtn setTitle:@"请点击登陆" forState:UIControlStateNormal];
            };
            [self.navigationController pushViewController:ctrl animated:YES];
        }
        break;
            
        default:
            break;
    }
}

@end
