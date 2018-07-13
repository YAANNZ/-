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
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *tasksDict = self.dataArray[section];
    return [tasksDict[PPSHomeTasksAryKey] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PPSHomeTableViewCell *cell = [PPSHomeTableViewCell cellWithTableView:tableView];
    NSDictionary *tasksDict = self.dataArray[indexPath.section];
    cell.dataModel = [tasksDict[PPSHomeTasksAryKey] objectAtIndex:indexPath.row];
    return cell;
}

@end
