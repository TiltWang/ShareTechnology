//
//  STWCoreDataViewController.m
//  ShareTechnology
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 thirdx. All rights reserved.
//

#import "STWCoreDataViewController.h"
#import "TWWork+CoreDataProperties.h"

@interface STWCoreDataViewController ()
@property (nonatomic, strong) NSArray *btnArr;
@end

@implementation STWCoreDataViewController

- (void)btnClick:(UIButton *)btn {
    NSLog(@"%@", btn.titleLabel.text);
    switch (btn.tag) {
        case 0://添加
        {
            [[DBManager sharedInstance] addUserWithName:@"wxf" userId:@"7521"];
        }
            break;
        case 1://删除
        {
            [[DBManager sharedInstance] deleteUserWithName:@"wxf"];
        }
            break;
        case 2://修改
        {
            [[DBManager sharedInstance] updateUserName:@"wxf" replaceAge:17];
        }
            break;
        case 3://查询
        {
            [[DBManager sharedInstance] searchUser];
        }
            break;
        default:
            break;
    }
    
}

- (NSArray *)btnArr {
    if (!_btnArr) {
        _btnArr = @[
                    @"添加",
                    @"删除",
                    @"修改",
                    @"查询",
                    ];
    }
    return _btnArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
}

- (void)setupUI {
    CGFloat width = [UIScreen mainScreen].bounds.size.width / self.btnArr.count;
    for (NSInteger i = 0; i < self.btnArr.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i * width, NAVIGATION_BAR_HEIGHT, width, 30)];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn setTitle:self.btnArr[i] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    } 
}

@end
