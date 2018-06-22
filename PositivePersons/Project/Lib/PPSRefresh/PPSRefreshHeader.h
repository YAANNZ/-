//
//  PPSRefreshHeader.h
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/21.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PPSRefreshHeaderBlock)(void);
@interface PPSRefreshHeader : NSObject

@property (nonatomic, copy) PPSRefreshHeaderBlock beginRefreshingBlock;

+ (PPSRefreshHeader *)headerWithScrollView:(UIScrollView *)scrollView RefreshingAction:(PPSRefreshHeaderBlock)actionBlock;
-(void)endRefreshing;
-(void)beginRefreshing;

@end
