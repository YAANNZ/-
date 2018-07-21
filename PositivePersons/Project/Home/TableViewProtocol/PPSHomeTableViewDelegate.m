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
    UILabel *headerLabel = [[UILabel alloc] init];
    NSDictionary *dataDict = self.dataArray[section];
    headerLabel.textColor = [UIColor blackColor];
    headerLabel.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0];
    
    if (section == 0 || [[dataDict objectForKey:PPSHomeTasksAryKey] count] != 0)
    {
        headerLabel.text = [self.dataArray[section] objectForKey:PPSHomeTasksTitleKey];
    }
    
    return headerLabel;
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
