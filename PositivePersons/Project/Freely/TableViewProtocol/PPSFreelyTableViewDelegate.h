//
//  PPSFreelyTableViewDelegate.h
//  PositivePersons
//
//  Created by ZHUYN on 2018/9/22.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PPSFreelyTableViewDelegateBlock)(NSString *titleStr);

@interface PPSFreelyTableViewDelegate : NSObject <UITableViewDelegate>

@property (nonatomic, copy) PPSFreelyTableViewDelegateBlock selectBlock;
@property (nonatomic, strong) NSArray *titleArray;

@end
