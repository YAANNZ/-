//
//  PPSHomeTableViewModel.h
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/27.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPSInputTaskView.h"
#import "PPSClockView.h"

typedef void(^Callback)(NSArray *array, BOOL isSuccess, NSString *errorStr);


@interface PPSHomeTableViewModel : NSObject <PPSInputTaskViewDelegate, PPSClockViewDelegate>

@property (nonatomic, copy) Callback callback;

- (void)requestSqliteDataWithCallback:(Callback)callback;
- (void)headerRefreshRequestWithCallback:(Callback)callback;
- (void)footerRefreshRequestWithCallback:(Callback)callback;

@end
