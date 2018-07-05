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

- (void)requestSqliteDataWithCallback:(Callback)callback
{
    PPSDataBaseHelper *dbHelper = [PPSDataBaseHelper shareInstance];
    NSArray *tasksArray = [dbHelper readTasksTable];
    callback(tasksArray, YES, nil);
}

- (void)headerRefreshRequestWithCallback:(Callback)callback
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:home_allTasks parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"flag"] integerValue] == 0)
        {
            NSArray *dataAry = [PPSHomeModel mj_objectArrayWithKeyValuesArray:responseObject[@"result"]];
            callback(dataAry, YES, nil);
        }
        else
        {
            callback(nil, NO, responseObject[@"msg"]);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callback(nil, NO, error.localizedDescription);
        NSLog(@"%@", error.localizedDescription);
    }];
}

- (void)footerRefreshRequestWithCallback:(Callback)callback
{
    
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
    
    [self requestSqliteDataWithCallback:self.callback];
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
