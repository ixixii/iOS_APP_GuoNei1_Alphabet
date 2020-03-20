//
//  MasterViewController.m
//  tmp
//
//  Created by beyond on 2020/03/16.
//  Copyright © 2020 beyond. All rights reserved.
//

#import "MasterViewController.h"
#import "ThaiAlphaViewController.h"
#import "KoreanAlphaViewController.h"
#import "ArabAlphaViewController.h"

#import "UIView+Frame.h"

#define ScreenBounds [UIScreen mainScreen].bounds
#define ScreenWidth ScreenBounds.size.width
#define ScreenHeight ScreenBounds.size.height

@interface MasterViewController ()<UITableViewDelegate>
{
    NSArray *_subjectArr;
    NSMutableArray *_modelArr;
    
    UIButton *_mineBtn;
}
@end

@implementation MasterViewController

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
//    NSArray* windows = [UIApplication sharedApplication].windows;
//    UIWindow *window = [windows objectAtIndex:0];
//    [window addSubview:_mineBtn];
    NSLog(@"sg__will appear");
    _mineBtn.y = ScreenHeight - 45 - 8;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [_mineBtn removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    // 将子View的 返回按钮 文字去掉
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] init];
    backBtn.title = @"";
    self.navigationItem.backBarButtonItem = backBtn;
    
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.delegate = self;
    
    [self loadPlist];
    
    [self addPersonBtn];
}
- (void)addPersonBtn
{
    UIButton *btn = [[UIButton alloc]init];
    btn.showsTouchWhenHighlighted = YES;
    btn.frame = CGRectMake(ScreenWidth - 45 - 8, ScreenHeight - 45 - 8, 45, 45);
    [btn setBackgroundImage:[UIImage imageNamed:@"mine.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(mineBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    _mineBtn = btn;
    
    NSArray* windows = [UIApplication sharedApplication].windows;
    UIWindow *window = [windows objectAtIndex:0];
    [window addSubview:btn];
}
- (void)mineBtnClicked:(UIButton *)btn
{
    btn.y = 1000;
    UIViewController *ctrl = [[NSClassFromString(@"MineViewController") alloc]init];
    [self.navigationController pushViewController:ctrl animated:YES];
}
- (void)loadPlist
{
    _subjectArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"subjectArr.plist" ofType:nil inDirectory:nil]];
    NSLog(@"sg__%@",_subjectArr);
}

- (void)insertNewObject:(id)sender {
    if (!_modelArr) {
        _modelArr = [[NSMutableArray alloc] init];
    }
    
    if([_modelArr count] == [_subjectArr count]){
        self.navigationItem.rightBarButtonItem.enabled = false;
        return;
    }
    
    NSDictionary *dict = [_subjectArr objectAtIndex:[_modelArr count]];
    [_modelArr addObject:dict];
    [self.tableView reloadData];
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _modelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id_cell" forIndexPath:indexPath];
    NSDictionary *dict = _modelArr[indexPath.row];
    cell.textLabel.text = dict[@"title"];
    cell.detailTextLabel.text = dict[@"desc"];
    cell.detailTextLabel.numberOfLines = 0;
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_modelArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        if([_modelArr count] == 0){
            self.navigationItem.rightBarButtonItem.enabled = true;
            return;
        }
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

#pragma mark - tableView 代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dict = [_modelArr objectAtIndex:indexPath.row];
    UIViewController *ctrl = [[NSClassFromString(dict[@"className"]) alloc] init];
    ctrl.title = dict[@"title"];
    [self.navigationController pushViewController:ctrl animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
@end
