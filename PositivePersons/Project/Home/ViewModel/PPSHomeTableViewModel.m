//
//  PPSHomeTableViewModel.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/27.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSHomeTableViewModel.h"

@implementation PPSHomeTableViewModel

- (void)getAllOptionsData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:home_allTasks parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"flag"] integerValue] == 0)
        {
            
        }
        else
        {
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //        NSLog(@"%@",error.localizedDescription);
    }];
}

@end
