//
//  PPSClockView.h
//  PositivePersons
//
//  Created by ZHUYN on 2018/7/4.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PPSClockView;
@protocol PPSClockViewDelegate <NSObject>

- (void)clockView:(PPSClockView *)clockView startWithDuration:(NSString *)duration;

@end

@interface PPSClockView : UIView

@property (nonatomic, weak) id <PPSClockViewDelegate> delegate;

@end
