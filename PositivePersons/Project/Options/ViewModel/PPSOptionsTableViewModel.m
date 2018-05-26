//
//  PPSOptionsTableViewModel.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/17.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSOptionsTableViewModel.h"

@implementation PPSOptionsTableViewModel

- (void)getAllOptionsData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:options_allOptions parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
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
