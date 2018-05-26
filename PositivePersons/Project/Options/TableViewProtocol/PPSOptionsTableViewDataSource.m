//
//  PPSOptionsTableViewDataSource.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/19.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSOptionsTableViewDataSource.h"
#import "PPSOptionsTableViewCell.h"

@implementation PPSOptionsTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PPSOptionsTableViewCell *cell = [PPSOptionsTableViewCell cellWithTableView:tableView];
    cell.optionData = self.dataArray[indexPath.row];
    return cell;
}

@end
