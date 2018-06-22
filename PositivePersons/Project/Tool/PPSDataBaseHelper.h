//
//  PPSDataBaseHelper.h
//  PositivePersons
//
//  Created by ZHUYN on 2018/6/15.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPSHomeModel.h"

@interface PPSDataBaseHelper : NSObject

+ (PPSDataBaseHelper *)shareInstance;

- (void)updateTasksTableWith:(PPSHomeModel *)taskModel;
- (NSArray <PPSHomeModel *> *)readTasksTable;

@end
