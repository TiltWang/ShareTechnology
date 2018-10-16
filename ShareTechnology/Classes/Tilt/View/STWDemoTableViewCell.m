//
//  STWDemoTableViewCell.m
//  ShareTechnology
//
//  Created by Tilt on 2018/10/15.
//  Copyright © 2018年 thirdx. All rights reserved.
//

#import "STWDemoTableViewCell.h"

@interface STWDemoTableViewCell ()
@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UILabel *subtitleLbl;
@end

@implementation STWDemoTableViewCell

+ (CGFloat)rowHeight {
    return 65.0;
}

- (void)setModel:(STWDemoModel *)model {
    _model = model;
    self.titleLbl.text = model.title;
    self.subtitleLbl.text = model.subtitle;
}


- (UILabel *)titleLbl {
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.font = [UIFont systemFontOfSize:16];
    }
    return _titleLbl;
}
- (UILabel *)subtitleLbl {
    if (!_subtitleLbl) {
        _subtitleLbl = [[UILabel alloc] init];
        _subtitleLbl.font = [UIFont systemFontOfSize:14];
        _subtitleLbl.textColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    }
    return _subtitleLbl;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self.contentView addSubview:self.titleLbl];
    [self.contentView addSubview:self.subtitleLbl];
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(20);
    }];
    [self.subtitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView).offset(-10);
        make.left.equalTo(self.titleLbl);
    }];
}
@end
