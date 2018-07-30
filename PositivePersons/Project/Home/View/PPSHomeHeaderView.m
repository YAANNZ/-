//
//  PPSHomeHeaderView.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/7/22.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSHomeHeaderView.h"

@implementation PPSHomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
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
    [self addSubview:headerLabel];
    
    UIButton *addTaskBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addTaskBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [addTaskBtn addTarget:self action:@selector(addTaskBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:addTaskBtn];
    
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

- (void)addTaskBtnClicked:(UIButton *)taskBtn
{
    
}


@end
