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

- (void)headerRefreshRequestWithCallback:(callback)callback
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

- (void)footerRefreshRequestWithCallback:(callback)callback
{
    
}


#pragma mark - PPSInputTaskViewDelegate
- (void)inputTaskView:(PPSInputTaskView *)inputView finishIuputWithContent:(NSString *)content
{
    inputView.hidden = YES;
    
    
}


@end
