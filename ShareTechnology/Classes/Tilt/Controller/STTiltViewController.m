//
//  STTiltViewController.m
//  ShareTechnology
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 thirdx. All rights reserved.
//

#import "STTiltViewController.h"
#import "STWDemoModel.h"
#import "STWDemoTableViewCell.h"

@interface STTiltViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *demoList;

@property (nonatomic, strong) UITableView *tableView;
@end

static NSString *DemoTableViewReuseCell = @"DemoTableViewReuseCell";

@implementation STTiltViewController

#pragma mark – Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self buildRightNavWithTitle:@"工具" action:@selector(showTools)];
}

#pragma mark - Events

- (void)showTools {
    [[FLEXManager sharedManager] showExplorer];
}

//#pragma mark – Private Methods

//#pragma mark - UITextFieldDelegate

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.demoList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    STWDemoModel *model = self.demoList[indexPath.row];
    STWDemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DemoTableViewReuseCell];
    cell.model = model;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [STWDemoTableViewCell rowHeight];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    STWDemoModel *model = self.demoList[indexPath.row];
    Class class = NSClassFromString(model.jump);
    UIViewController *vc = [[class alloc] init];
    vc.title = model.title;
    [self.navigationController pushViewController:vc animated:YES];
}

//#pragma mark - Custom Delegates

#pragma mark – Getters and Setters

- (NSArray *)demoList {
    if (!_demoList) {
        _demoList = [[NSArray alloc] init];
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DemoList.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:arr.count];
        for (NSInteger i = 0; i < arr.count; i++) {
            STWDemoModel *model =  [STWDemoModel mj_objectWithKeyValues:arr[i]];
            [arrM addObject:model];
        }
        _demoList = [arrM copy];
    }
    return _demoList;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[STWDemoTableViewCell class] forCellReuseIdentifier:DemoTableViewReuseCell];
    }
    return _tableView;
}

@end
