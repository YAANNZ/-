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
    
}

@end
