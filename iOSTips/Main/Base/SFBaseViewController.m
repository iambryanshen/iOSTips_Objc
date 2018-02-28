//
//  SFBaseViewController.m
//  iOSTips
//
//  Created by brian on 2018/2/28.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFBaseViewController.h"

@interface SFBaseViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<NSArray<NSString *> *> *keys;
@property (nonatomic, strong) NSMutableArray<NSArray<UIViewController *> *> *viewControllers;

@end
static NSString *kTableViewCell = @"kTableViewCell";
@implementation SFBaseViewController

#pragma mark - 懒加载属性
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    }
    return _tableView;
}

- (NSArray *)header {
    if (_header == nil) {
        _header = [[NSArray alloc] init];
    }
    return _header;
}

- (NSArray<NSDictionary *> *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [[NSArray alloc] init];
    }
    return _dataSource;
}

- (NSMutableArray<NSArray<NSString *> *> *)keys {
    if (_keys == nil) {
        _keys = [[NSMutableArray alloc] init];
    }
    return _keys;
}

- (NSMutableArray<NSArray<UIViewController *> *> *)viewControllers {
    if (_viewControllers == nil) {
        _viewControllers = [[NSMutableArray alloc] init];
    }
    return _viewControllers;
}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubviews];
    [self setupDataSource];
}

#pragma mark - 设置子控件
- (void)setupSubviews {
    
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCell];
}

- (void)setupDataSource {
    
    [self.dataSource enumerateObjectsUsingBlock:^(NSDictionary<NSString *,UIViewController *> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.keys addObject:obj.allKeys];
        [self.viewControllers addObject:obj.allValues];
    }];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataSource.count;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource[section].count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCell forIndexPath:indexPath];
    cell.textLabel.text = _keys[indexPath.section][indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = _viewControllers[indexPath.section][indexPath.row];
    vc.title = _keys[indexPath.section][indexPath.row];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:true];
}

@end
