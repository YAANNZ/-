//
//  PPSHomeTableViewModel.h
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/27.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPSInputTaskView.h"

typedef void(^callback)(NSArray *array, BOOL isSuccess, NSString *errorStr);

@interface PPSHomeTableViewModel : NSObject <PPSInputTaskViewDelegate>

- (void)requestSqliteDataWithCallback:(callback)callback;
- (void)headerRefreshRequestWithCallback:(callback)callback;
- (void)footerRefreshRequestWithCallback:(callback)callback;

@end
