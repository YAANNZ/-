//
//  PPSHomeTableViewModel.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/27.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSHomeTableViewModel.h"
#import "PPSHomeModel.h"

@implementation PPSHomeTableViewModel
// 读取数据库
- (void)requestSqliteData
{
    PPSDataBaseHelper *dbHelper = [PPSDataBaseHelper shareInstance];
    NSArray *tasksArray = [dbHelper readTasksTable];
    
    [self FormatDataAndPostNotificationWithArray:tasksArray errorDescription:nil];
}

// 下拉刷新
- (void)headerRefreshRequest
{
    __weak typeof (self) weakself = self;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:home_allTasks parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        __strong typeof (weakself) strongself = weakself;
        if ([responseObject[@"flag"] integerValue] == 0)
        {
            NSArray *dataAry = [PPSHomeModel mj_objectArrayWithKeyValuesArray:responseObject[@"result"]];
            [strongself FormatDataAndPostNotificationWithArray:dataAry errorDescription:nil];
        }
        else
        {
            [strongself FormatDataAndPostNotificationWithArray:nil errorDescription:responseObject[@"msg"]];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        __strong typeof (weakself) strongself = weakself;
        [strongself FormatDataAndPostNotificationWithArray:nil errorDescription:error.localizedDescription];
        DLog(@"%@", error.localizedDescription);
    }];
}

- (void)footerRefreshRequest
{
    
}

// 整理数据并通知 controller 更新 UI
- (void)FormatDataAndPostNotificationWithArray:(NSArray *)tasksArray errorDescription:(NSString *)errorDescription
{
    NSMutableDictionary *resultDict = [NSMutableDictionary dictionary];
    
    if (!tasksArray)
    {
        resultDict[ErrorLocalDiscription] = errorDescription;
        resultDict[StateCode] = @"1";
        
        [[NSNotificationCenter defaultCenter] postNotificationName:PPSHomeTableViewNeedReload object:nil userInfo:resultDict];
        
        return;
    }
    
    NSMutableArray *inProgressTasksAry = [NSMutableArray array];
    NSMutableArray *finishedTasksAry = [NSMutableArray array];
    
    for (PPSHomeModel *taskModel in tasksArray)
    {
        if ([taskModel.state isEqualToString:TasksInProgressState])
        {
            [inProgressTasksAry addObject:taskModel];
        }
        else if ([taskModel.state isEqualToString:TasksFinishedState])
        {
            [finishedTasksAry addObject:taskModel];
        }
    }
    
    NSMutableDictionary *inProgressTasksDict = [NSMutableDictionary dictionary];
    inProgressTasksDict[PPSHomeTasksTitleKey] = InProgressTasksTitleValue;
    inProgressTasksDict[PPSHomeTasksAryKey] = inProgressTasksAry;
    
    NSMutableDictionary *finishedTasksDict = [NSMutableDictionary dictionary];
    finishedTasksDict[PPSHomeTasksTitleKey] = FinishedTasksTitleValue;
    finishedTasksDict[PPSHomeTasksAryKey] = finishedTasksAry;
    
    NSArray *realTasksAry = [NSArray arrayWithObjects:inProgressTasksDict, finishedTasksDict, nil];

    resultDict[StateCode] = @"0";
    [[NSNotificationCenter defaultCenter] postNotificationName:PPSHomeTableViewNeedReload object:realTasksAry userInfo:resultDict];
}

#pragma mark - PPSInputTaskViewDelegate
- (void)inputTaskView:(PPSInputTaskView *)inputView finishIuputWithContent:(NSString *)content
{
    inputView.hidden = YES;
    UITextField *textField = inputView.subviews.firstObject;
    textField.text = @"";
    [textField resignFirstResponder];
    
    PPSHomeModel *homeModel = [[PPSHomeModel alloc] init];
    homeModel.taskStr = content;
    homeModel.state = @"0";
    homeModel.createDate = [self currentDate];
    
    PPSDataBaseHelper *dbHelper = [PPSDataBaseHelper shareInstance];
    [dbHelper updateTasksTableWith:homeModel];
    
    [self requestSqliteData];
}

- (NSString *)currentDate
{
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *dateStr = [formatter stringFromDate:currentDate];
    
    return dateStr;
}

#pragma mark - PPSClockViewDelegate
- (void)clockView:(PPSClockView *)clockView startWithDuration:(NSString *)duration
{
    clockView.hidden = YES;
    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:<#(NSTimeInterval)#> repeats:<#(BOOL)#> block:<#^(NSTimer * _Nonnull timer)block#>];
}


@end
