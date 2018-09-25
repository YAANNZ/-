//
//  PPSFreelyTableViewDelegate.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/9/22.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSFreelyTableViewDelegate.h"
#import "PPSFreelyTableViewHeaderView.h"

@implementation PPSFreelyTableViewDelegate


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2)
    {
        return 150;
    }
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    PPSFreelyTableViewHeaderView *headerView = [PPSFreelyTableViewHeaderView headerViewWithTableView:tableView];
    headerView.titleStr = self.titleArray[section];
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0)
    {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (self.selectBlock) {
            self.selectBlock(cell.textLabel.text);
        }
    }
    
}

@end
