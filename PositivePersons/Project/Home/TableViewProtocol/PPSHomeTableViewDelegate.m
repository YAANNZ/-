//
//  PPSHomeTableViewDelegate.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/27.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSHomeTableViewDelegate.h"

@implementation PPSHomeTableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0];
    
    UILabel *headerLabel = [[UILabel alloc] init];
    headerLabel.textColor = [UIColor blackColor];
    [headerView addSubview:headerLabel];
    
    UIButton *addTaskBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addTaskBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [headerView addSubview:addTaskBtn];
    
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
    
    // 赋值
    NSDictionary *dataDict = self.dataArray[section];
    if (section == 0 || [[dataDict objectForKey:PPSHomeTasksAryKey] count] != 0)
    {
        headerLabel.text = [self.dataArray[section] objectForKey:PPSHomeTasksTitleKey];
    }
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section)
    {
        NSDictionary *finishtDict = self.dataArray[section];
        if ([[finishtDict objectForKey:PPSHomeTasksAryKey] count] == 0)
        {
            return CGFLOAT_MIN;
        }
    }
    return 40;
}


@end
