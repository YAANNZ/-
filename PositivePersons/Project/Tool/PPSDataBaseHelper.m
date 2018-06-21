//
//  PPSDataBaseHelper.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/6/15.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSDataBaseHelper.h"
#import "FMDB.h"

@interface PPSDataBaseHelper ()

@property (nonatomic, strong) FMDatabaseQueue *dbQueue;

@end

@implementation PPSDataBaseHelper

#pragma mark - initial
+ (PPSDataBaseHelper *)shareInstance
{
    static PPSDataBaseHelper *dbHelperInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dbHelperInstance = [[self alloc] init];
        [dbHelperInstance dbQueue];
    });
    
    return dbHelperInstance;
}

- (FMDatabaseQueue *)dbQueue
{
    if (!_dbQueue)
    {
        NSString *dbQueuePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"xx.sqlite"];
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:dbQueuePath];
    }
    
    if (_dbQueue)
    {
        [self createAllTableIfNeed];
    }
    
    return _dbQueue;
}

- (void)createAllTableIfNeed
{
    [self.dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        // 任务
        NSString *tasksSQL = @"CREATE TABLE IF NOT EXISTS t_tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, task BLOB NOT NULL, createDate TEXT NOT NULL, taskStr TEXT NOT NULL, state TEXT NOT NULL);";
        [db executeUpdate:tasksSQL];
    }];
}

#pragma mark - operation
- (void)updateTasksTableWith:(PPSHomeModel *)taskModel
{
    NSMutableDictionary *taskDict = [taskModel mj_keyValues];
    NSData *taskData = [NSJSONSerialization dataWithJSONObject:taskDict options:NSJSONWritingPrettyPrinted error:nil];
    [self.dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        BOOL isSuccess = [db executeUpdate:@"INSERT INTO t_tasks (task, createDate, taskStr, state) VALUES (?, ?, ?) ;", taskData, taskModel.createDate, taskModel.taskStr, taskModel.state];
        DLog(@"%d", isSuccess);
    }];
}

@end
