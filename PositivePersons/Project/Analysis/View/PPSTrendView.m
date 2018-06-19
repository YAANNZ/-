//
//  PPSTrendView.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/6/19.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSTrendView.h"

@implementation PPSTrendView

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
    self.backgroundColor = [UIColor blueColor];
}

@end
