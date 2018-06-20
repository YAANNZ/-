//
//  PPSInputTaskView.h
//  PositivePersons
//
//  Created by ZHUYN on 2018/6/20.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PPSInputTaskView;
@protocol PPSInputTaskViewDelegate <NSObject>

- (void)inputTaskView:(PPSInputTaskView *)inputView finishIuputWithContent:(NSString *)content;

@end

@interface PPSInputTaskView : UIView

@property (nonatomic, weak) id <PPSInputTaskViewDelegate> delegate;

@end
