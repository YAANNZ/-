//
//  PPSHomeTableViewCell.h
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/27.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPSHomeModel.h"

@interface PPSHomeTableViewCell : UITableViewCell

@property (nonatomic, strong) PPSHomeModel *dataModel;
@property (nonatomic, weak) UILabel *taskLabel;

+ (PPSHomeTableViewCell *)cellWithTableView:(UITableView *)tableView;

@end
