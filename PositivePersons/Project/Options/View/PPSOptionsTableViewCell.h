//
//  PPSOptionsTableViewCell.h
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/17.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPSOptionModel.h"

@interface PPSOptionsTableViewCell : UITableViewCell

@property (nonatomic, weak) UILabel *optionLabel;
@property (nonatomic, strong) PPSOptionModel *optionData;

+ (PPSOptionsTableViewCell *)cellWithTableView:(UITableView *)tableView;

@end
