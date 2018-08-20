//
//  PPSInputTaskView.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/6/20.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSInputTaskView.h"

@interface PPSInputTaskView ()

@property (nonatomic, strong) UITextView *taskTextField;
@property (nonatomic, strong) UIButton *doneButton;

@end

@implementation PPSInputTaskView

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
    
    self.taskTextField = [[UITextView alloc] init];
    self.taskTextField.placeholder = @"请添加任务...";
    self.taskTextField.font = [UIFont systemFontOfSize:15];
    self.taskTextField.backgroundColor = [UIColor whiteColor];
    self.taskTextField.layer.borderColor = [UIColor blackColor].CGColor;
    self.taskTextField.layer.borderWidth = 1.0;
    [self addSubview:self.taskTextField];
    
    self.doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.doneButton.layer.cornerRadius = 5;
    self.doneButton.backgroundColor = [UIColor blackColor];
    [self.doneButton setTitle:@"Add" forState:UIControlStateNormal];
    [self.doneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.doneButton addTarget:self action:@selector(doneButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.doneButton];
    
    [self setupMasonry];
}

- (void)setupMasonry
{
    [self.taskTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@10);
        make.right.equalTo(@-10);
        make.height.equalTo(@140);
    }];
    
    [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.taskTextField.mas_bottom).offset(10);
        make.width.equalTo(@40);
        make.height.equalTo(@20);
        make.centerX.equalTo(@0);
    }];
}

- (void)doneButtonClicked:(UIButton *)doneBtn
{
    if ([self.delegate respondsToSelector:@selector(inputTaskView:finishIuputWithContent:)])
    {
        [self.delegate inputTaskView:self finishIuputWithContent:self.taskTextField.text];
    }
    
    
}


@end
