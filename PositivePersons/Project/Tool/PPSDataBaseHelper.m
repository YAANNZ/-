//
//  PPSDataBaseHelper.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/6/15.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSDataBaseHelper.h"
#import "FMDB.h"

@implementation PPSDataBaseHelper

+ (PPSDataBaseHelper *)sharenstance
{
    static PPSDataBaseHelper *dbHelperInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dbHelperInstance = [[self alloc] init];
        [dbHelperInstance dbQueue];
    });
    
    return dbHelperInstance;
}

- (void)dbQueue
{
    
}

@end
