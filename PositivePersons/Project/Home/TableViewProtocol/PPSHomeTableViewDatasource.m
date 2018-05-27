//
//  PPSHomeTableViewDatasource.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/27.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSHomeTableViewDatasource.h"
#import "PPSHomeTableViewCell.h"

@implementation PPSHomeTableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PPSHomeTableViewCell *cell = [PPSHomeTableViewCell cellWithTableView:tableView];
    cell.dataModel = self.dataArray[indexPath.row];
    return cell;
}

@end
