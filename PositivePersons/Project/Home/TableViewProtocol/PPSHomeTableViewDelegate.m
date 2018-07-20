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
    headerLabel.text = [self.dataArray[section] objectForKey:PPSHomeTasksTitleKey];
    headerLabel.frame = CGRectMake(0, 0, MAINSCREEN_WIDTH, 40);
    return headerLabel;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.dataArray.count == 0 && section)
    {
        return 0;
    }
    return 40;
}


@end
