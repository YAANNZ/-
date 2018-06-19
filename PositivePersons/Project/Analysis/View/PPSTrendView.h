//
//  PPSTrendView.h
//  PositivePersons
//
//  Created by ZHUYN on 2018/6/19.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PPSTrendViewDelegate <NSObject>

@end

@interface PPSTrendView : UIView

@property (nonatomic, weak) id <PPSTrendViewDelegate> delegate;

@end
