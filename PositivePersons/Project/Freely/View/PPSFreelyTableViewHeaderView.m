//
//  PPSFreelyTableViewHeaderView.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/9/22.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSFreelyTableViewHeaderView.h"

@interface PPSFreelyTableViewHeaderView ()

@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UIImageView *arrowImgV;
@property (nonatomic, assign) BOOL isOpen;

@end

@implementation PPSFreelyTableViewHeaderView

+ (PPSFreelyTableViewHeaderView *)headerViewWithTableView:(UITableView *)tableView
{
    PPSFreelyTableViewHeaderView *freelyHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:PPSFreelyTableViewHeaderViewID];
    if (!freelyHeaderView)
    {
        freelyHeaderView = [[PPSFreelyTableViewHeaderView alloc] initWithReuseIdentifier:PPSFreelyTableViewHeaderViewID];
    }
    
    return freelyHeaderView;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier])
    {
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"title";
    self.titleLabel = titleLabel;
    [self addSubview:titleLabel];
    
    UIImageView *arrowImgV = [[UIImageView alloc] init];
    self.arrowImgV = arrowImgV;
    arrowImgV.image = [UIImage imageNamed:@"freely_arrow"];
    [self addSubview:arrowImgV];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.mas_equalTo(0);
    }];
    
    [arrowImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.centerY.mas_equalTo(0);
    }];
}

- (void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    self.titleLabel.text = titleStr;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
