//
//  PPSHomeHeaderView.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/7/22.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSHomeHeaderView.h"

@interface PPSHomeHeaderView ()

@property (nonatomic, weak) UILabel *headerLabel;

@end

@implementation PPSHomeHeaderView

+ (PPSHomeHeaderView *)homeHeaderViewWithTableView:(UITableView *)tableView
{
    static NSString *homeHeaderViewID = @"homeHeaderView";
    
    PPSHomeHeaderView *homeHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:homeHeaderViewID];
    if (!homeHeaderView)
    {
        homeHeaderView = [[PPSHomeHeaderView alloc] initWithReuseIdentifier:homeHeaderViewID];
    }
    return homeHeaderView;
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
    self.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0];
    
    UILabel *headerLabel = [[UILabel alloc] init];
    headerLabel.textColor = [UIColor blackColor];
    self.headerLabel = headerLabel;
    [self.contentView addSubview:headerLabel];
    
    UIButton *addTaskBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addTaskBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [addTaskBtn addTarget:self action:@selector(addTaskBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:addTaskBtn];
    
    // 约束
    [headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.top.bottom.right.equalTo(@0);
    }];
    [addTaskBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.bottom.equalTo(@-5);
        make.right.equalTo(@-10);
    }];
}

- (void)setTitleString:(NSString *)titleString
{
    _titleString = titleString;
    
    self.headerLabel.text = titleString;
}

- (void)addTaskBtnClicked:(UIButton *)taskBtn
{
    [[NSNotificationCenter defaultCenter] postNotificationName:AddTaskNotification object:nil];
}


@end
