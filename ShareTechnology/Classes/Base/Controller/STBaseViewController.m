//
//  STBaseViewController.m
//  ShareTechnology
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 thirdx. All rights reserved.
//

#import "STBaseViewController.h"

@interface STBaseViewController ()

@end

@implementation STBaseViewController


#pragma mark – Life Cycle

#pragma mark - Events

#pragma mark – Private Methods

#pragma mark - UITextFieldDelegate

#pragma mark - UITableViewDataSource

#pragma mark - UITableViewDelegate

#pragma mark - Custom Delegates

#pragma mark – Getters and Setters 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];//[UIColor colorWithGradientStyle:UIGradientStyleTopToBottom withFrame:[UIScreen mainScreen].bounds andColors:@[[UIColor colorWithHexString:@"6aadff"], [UIColor colorWithHexString:@"99e4f7"]]];
}

- (void)buildRightNavWithTitle:(NSString *)title action:(SEL)action {
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:title forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    CGFloat fontSize = 15.0;
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [rightBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    rightBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 11, 0, 0);
    CGFloat width = [title getStringWidthWithFont:[UIFont systemFontOfSize:fontSize] textMaxHeight:30];
    rightBtn.frame = CGRectMake(0, 0, width + 20, 40);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}



@end
