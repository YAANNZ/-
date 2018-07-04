//
//  PPSClockView.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/7/4.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSClockView.h"

@interface PPSClockView ()

@property (nonatomic, strong) UITextField *clockField;
@property (nonatomic, strong) UIButton *startButton;

@end

@implementation PPSClockView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupSubviews];
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
    self.backgroundColor = [UIColor lightGrayColor];
    
    self.clockField = [[UITextField alloc] init];
    self.clockField.text = @"5";
    self.clockField.font = [UIFont systemFontOfSize:15];
    self.clockField.backgroundColor = [UIColor whiteColor];
    self.clockField.layer.borderColor = [UIColor blackColor].CGColor;
    self.clockField.layer.borderWidth = 1.0;
    [self addSubview:self.clockField];
    
    self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.startButton.layer.cornerRadius = 5;
    self.startButton.backgroundColor = [UIColor blackColor];
    [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    [self.startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.startButton addTarget:self action:@selector(startButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.startButton];
    
    [self setupMasonry];
}

- (void)setupMasonry
{
    [self.clockField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@10);
        make.right.equalTo(@-10);
        make.height.equalTo(@140);
    }];
    
    [self.startButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.clockField.mas_bottom).offset(10);
        make.width.equalTo(@40);
        make.height.equalTo(@20);
        make.centerX.equalTo(@0);
    }];
}

- (void)startButtonClicked:(UIButton *)doneBtn
{
    if ([self.delegate respondsToSelector:@selector(clockView:startWithDuration:)])
    {
        [self.delegate clockView:self startWithDuration:self.clockField.text];
    }
}

@end
