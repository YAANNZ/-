//
//  PPSHomeHeaderView.h
//  PositivePersons
//
//  Created by ZHUYN on 2018/7/22.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPSHomeHeaderView : UITableViewHeaderFooterView

@property (nonatomic, copy) NSString *titleString;

+ (PPSHomeHeaderView *)homeHeaderViewWithTableView:(UITableView *)tableView;

@end
