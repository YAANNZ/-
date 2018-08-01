//
//  PPSHomeTableViewDelegate.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/27.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSHomeHeaderView.h"
#import "PPSHomeTableViewDelegate.h"

@implementation PPSHomeTableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    PPSHomeHeaderView *headerView = [PPSHomeHeaderView homeHeaderViewWithTableView:tableView];
    
//    // 赋值
//    NSDictionary *dataDict = self.dataArray[section];
//    if (section == 0 || [[dataDict objectForKey:PPSHomeTasksAryKey] count] != 0)
//    {
        headerView.titleString = [self.dataArray[section] objectForKey:PPSHomeTasksTitleKey];
//    }
    
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
