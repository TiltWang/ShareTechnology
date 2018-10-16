//
//  STNavViewController.m
//  ShareTechnology
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 thirdx. All rights reserved.
//

#import "STNavViewController.h"

@interface STNavViewController () <UIGestureRecognizerDelegate>

@end

@implementation STNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
    
    ///设置导航栏背景色
//    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationBar.barTintColor = [UIColor colorWithGradientStyle:UIGradientStyleTopToBottom withFrame:[UIScreen mainScreen].bounds andColors:@[[UIColor colorWithHexString:@"6aadff"], [UIColor colorWithHexString:@"99e4f7"]]];
//    self.view.backgroundColor = mainColor;
    ///设置状态栏颜色
    self.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    ///设置隐藏导航栏下面的那条线
//    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (UIBarButtonItem *)buildBarItemWithImageName:(NSString *)imageName title:(NSString *)title target:(id)target action:(SEL)action {
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 35, 40)];
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
    //    btn.backgroundColor = [UIColor redColor];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    //    NSString *selectImageName = [NSString stringWithFormat:@"%@_highlighted",imageName];
    //    [btn setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateHighlighted];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //    [btn sizeToFit];
    barItem.customView = btn;
    return barItem;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //    NSString *backtitle = @"返回";
    NSInteger childCount = self.childViewControllers.count;
    if (childCount > 0) {
        //        if (childCount == 1) {
        //            backtitle = self.childViewControllers.firstObject.title;
        //        }
        
        //
        UIBarButtonItem *back = [self buildBarItemWithImageName:@"nav_icon_back" title:@"" target:self action:@selector(popToFrontVC)];
        viewController.navigationItem.leftBarButtonItem = back;
        viewController.hidesBottomBarWhenPushed = YES;
    } else {
        viewController.hidesBottomBarWhenPushed = NO;
    }
    [super pushViewController:viewController animated:animated];
}
- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSInteger childCount = self.childViewControllers.count;
    if (childCount > 0 ) {
        viewController.hidesBottomBarWhenPushed = YES;
    } else {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    return [super popToViewController:viewController animated:animated];
}

- (void)popToFrontVC {
    [self popViewControllerAnimated:YES];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.childViewControllers.count > 1;
}

@end
