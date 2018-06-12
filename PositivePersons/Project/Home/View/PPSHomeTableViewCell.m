//
//  PPSHomeTableViewCell.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/27.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSHomeTableViewCell.h"

@implementation PPSHomeTableViewCell

+ (PPSHomeTableViewCell *)cellWithTableView:(UITableView *)tableView
{
    PPSHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeTableViewCell"];
    if (!cell)
    {
        cell = [[PPSHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"homeTableViewCell"];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews
{
    UILabel *taskLabel = [[UILabel alloc] init];
    self.taskLabel = taskLabel;
    [self.contentView addSubview:taskLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.taskLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@5);
        make.right.bottom.equalTo(@-5);
    }];
}

- (void)setDataModel:(PPSHomeModel *)dataModel
{
    _dataModel = dataModel;
    
    self.taskLabel.text = dataModel.taskStr;
}




- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
