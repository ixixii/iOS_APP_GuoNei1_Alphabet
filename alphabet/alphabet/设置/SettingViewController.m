//
//  SettingViewController.m
//  alphabet
//
//  Created by beyond on 2020/03/12.
//  Copyright © 2020 Christine. All rights reserved.
//

#import "SettingViewController.h"
#import "SGTableViewCell.h"
#import "MBProgressHUD+NJ.h"

#define kColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define ScreenBounds [UIScreen mainScreen].bounds
#define ScreenWidth ScreenBounds.size.width
#define ScreenHeight ScreenBounds.size.height

@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_modelArr;
    UITableView *_tableView;
}
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.topItem.title = @"";
    
    [self addTableView];
    
    if([[[NSUserDefaults standardUserDefaults] objectForKey:@"userDefault_username"] length] > 0){
        _modelArr = @[
            @{
                @"icon": @"about.png", // 90px -> @3x
                @"title": @"关于"
            },
            @{
                @"icon": @"privacy.png",
                @"title": @"隐私"
            },
            @{
                @"icon": @"logout.png",
                @"title": @"退出"
            }
        ];
    }else{
        _modelArr = @[
            @{
                @"icon": @"about.png", // 90px -> @3x
                @"title": @"关于"
            },
            @{
                @"icon": @"privacy.png",
                @"title": @"隐私"
            }
        ];
    }
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
    return _modelArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        SGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sgtableviewcellid"];
        if (cell == nil) {
            cell = [SGTableViewCell tableViewCell];
        }
        cell.textLabel.numberOfLines = 0;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        NSDictionary *model = [_modelArr objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:[model objectForKey:@"icon"]];
        cell.textLabel.text = [model objectForKey:@"title"];
        return cell;
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
            NSLog(@"sg__1");
            UIViewController *ctrl = [[NSClassFromString(@"PrivacyViewCtrl") alloc]init];
            [self presentViewController:ctrl animated:YES completion:nil];
            
        }
        break;
        case 2:
        {
            NSLog(@"sg__2");
            // 根据用户上次选择的,展示
            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
            [userDefault setObject:@"" forKey:@"userDefault_username"];
            [userDefault synchronize];
            
            [MBProgressHUD showSuccess:@"退出成功！"];
            __weak __typeof__(self) weakSelf = self;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.navigationController popViewControllerAnimated:YES];
                if(weakSelf.btnClickBlock){
                    weakSelf.btnClickBlock();
                }
            });
        }
        break;
            
        default:
            break;
    }
}
@end
