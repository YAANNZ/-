//
//  PPSOptionsTableViewCell.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/17.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSOptionsTableViewCell.h"

@implementation PPSOptionsTableViewCell

+ (PPSOptionsTableViewCell *)cellWithTableView:(UITableView *)tableView
{
    PPSOptionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"optionsTableViewCell"];
    if (!cell)
    {
        cell = [[PPSOptionsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"optionsTableViewCell"];
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
    UILabel *optionLabel = [[UILabel alloc] init];
    self.optionLabel = optionLabel;
    [self.contentView addSubview:optionLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.optionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@5);
        make.right.bottom.equalTo(@-5);
    }];
}

- (void)setOptionData:(PPSOptionModel *)optionData
{
    _optionData = optionData;
    
    self.optionLabel.text = optionData.contentStr;
}





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
