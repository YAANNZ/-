//
//  PPSFreelyTableViewHeaderView.h
//  PositivePersons
//
//  Created by ZHUYN on 2018/9/22.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPSFreelyTableViewHeaderView : UITableViewHeaderFooterView

@property (nonatomic, copy) NSString *titleStr;
+ (PPSFreelyTableViewHeaderView *)headerViewWithTableView:(UITableView *)tableView;

@end
