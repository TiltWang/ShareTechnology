//
//  STTabBarViewController.m
//  ShareTechnology
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 thirdx. All rights reserved.
//

#import "STTabBarViewController.h"
#import "STNavViewController.h"
#import "STTiltViewController.h"
#import "STHanXiaoViewController.h"

@interface STTabBarViewController () <UITabBarControllerDelegate>

@end

@implementation STTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllers];
    UIColor *color = [UIColor colorWithGradientStyle:UIGradientStyleTopToBottom withFrame:[UIScreen mainScreen].bounds andColors:@[[UIColor colorWithHexString:@"6aadff"], [UIColor colorWithHexString:@"99e4f7"]]];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"515585"]}forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"b6b9e1"]}forState:UIControlStateNormal];
        [[UITabBar appearance] setBackgroundColor:color];
    [[UITabBar appearance] setBarTintColor:color];
    [UITabBar appearance].translucent = NO;
    self.delegate = self;
}

- (void)addChildViewControllers {
    [self addChildViewController:[[STTiltViewController alloc] init] withTitle:@"Tilt" withImageText:@"王"];
    [self addChildViewController:[[STHanXiaoViewController alloc] init] withTitle:@"HanXiao" withImageText:@"韩"];
}

- (void)addChildViewController:(UIViewController *)childController withTitle:(NSString *)title withImageText:(NSString *)imageText {
    CGFloat width = 30.0;
    childController.title = title;
    childController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    UIImage *normalImage = [imageText getWordImageWithSize:CGSizeMake(width, width) fontSize:width / 2.0 textColor:[UIColor whiteColor] backgroundColor:[UIColor lightGrayColor]];
    UIImage *selectedImage = [imageText getWordImageRandomBackgroundColorWithSize:CGSizeMake(width, width) fontSize:width / 2.0];
    childController.tabBarItem.image = [[[normalImage circleImage] scaleWithMultiple:1.0] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[[selectedImage circleImage] scaleWithMultiple:1.0] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    STNavViewController *navVc = [[STNavViewController alloc] initWithRootViewController:childController];
    [self addChildViewController:navVc];
    
}


@end
