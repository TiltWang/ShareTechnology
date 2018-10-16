//
//  STWCalculationOfWagesViewController.m
//  ShareTechnology
//
//  Created by Tilt on 2018/10/16.
//  Copyright © 2018年 thirdx. All rights reserved.
//

#import "STWCalculationOfWagesViewController.h"
#import "TWCalculationOfWagesCommon.h"

@interface STWCalculationOfWagesViewController ()
@property (nonatomic, strong) UITextField *inputTf;
@property (nonatomic, strong) UIButton *calculateBtn;
@property (nonatomic, strong) UILabel *outputLbl;
@end

@implementation STWCalculationOfWagesViewController

#pragma mark – Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.inputTf];
    [self.view addSubview:self.calculateBtn];
    [self.view addSubview:self.outputLbl];
    
    [self.inputTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(NAVIGATION_BAR_HEIGHT + 10);
        make.left.equalTo(self.view).offset(20);
        make.height.equalTo(@40);
    }];
    [self.calculateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.equalTo(self.inputTf);
        make.left.equalTo(self.inputTf.mas_right).offset(10);
        make.right.equalTo(self.view).offset(-20);
    }];
    [self.outputLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.inputTf);
        make.right.equalTo(self.calculateBtn);
        make.top.equalTo(self.inputTf.mas_bottom).offset(20);
    }];
}

#pragma mark - Events

- (void)calculateBtnClick {
    if (![self isPureFloat:self.inputTf.text]) {
        NSLog(@"输入不合法");
        return;
    }
    [self.view endEditing:YES];
    self.outputLbl.text = [TWCalculationOfWagesCommon getFinallyWagesBillWithGrossPay:[self.inputTf.text floatValue]].printStr;
}

#pragma mark – Private Methods

///判断字符串是否为float类型
- (BOOL)isPureFloat:(NSString *)string {
    NSScanner *scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

#pragma mark - UITextFieldDelegate

#pragma mark - UITableViewDataSource

#pragma mark - UITableViewDelegate

#pragma mark - Custom Delegates

#pragma mark – Getters and Setters

- (UITextField *)inputTf {
    if (!_inputTf) {
        _inputTf = [[UITextField alloc] init];
        _inputTf.keyboardType = UIKeyboardTypeNumberPad;
        _inputTf.backgroundColor = [UIColor lightGrayColor];
    }
    return _inputTf;
}

- (UIButton *)calculateBtn {
    if (!_calculateBtn) {
        _calculateBtn = [[UIButton alloc] init];
        [_calculateBtn setTitle:@"计算" forState:UIControlStateNormal];
        [_calculateBtn setTitleColor:[UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0] forState:UIControlStateNormal];
        [_calculateBtn addTarget:self action:@selector(calculateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _calculateBtn;
}

- (UILabel *)outputLbl {
    if (!_outputLbl) {
        _outputLbl = [[UILabel alloc] init];
        _outputLbl.numberOfLines = 0;
    }
    return _outputLbl;
}


@end
