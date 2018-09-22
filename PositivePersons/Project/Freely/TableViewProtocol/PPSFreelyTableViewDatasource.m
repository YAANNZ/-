//
//  PPSFreelyTableViewDatasource.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/9/22.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSFreelyTableViewDatasource.h"

@implementation PPSFreelyTableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)self.dataArray[section]).count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    switch (indexPath.section) {
        case 0:
        case 1:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:PPSFreelyTableViewCellID];
            cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
        }
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:PPSFreelyWordTableViewCellID];
            break;
        case 3:
            cell = [tableView dequeueReusableCellWithIdentifier:PPSFreelyAudioTableViewCellID];
            break;
        default:
            break;
    }
    
    return cell;
}


@end
