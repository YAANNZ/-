//
//  PPSAnalysisViewModel.h
//  PositivePersons
//
//  Created by ZHUYN on 2018/6/19.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPSTrendView.h"

typedef void(^Callback)(NSArray *array, BOOL isSuccess, NSString *errorStr);
@interface PPSAnalysisViewModel : NSObject <PPSTrendViewDelegate>

- (void)requesTrendViewDataWithCallback:(Callback)callback;

@end
