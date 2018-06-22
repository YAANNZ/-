//
//  PPSRefreshHeader.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/21.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSRefreshHeader.h"

@interface PPSRefreshHeader ()

@property (nonatomic, strong) UILabel *headerLabel;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIImageView *headerIV;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@property (nonatomic, assign) float lastPosition;
@property (nonatomic, assign) float contentHeight;
@property (nonatomic, assign) float headerHeight;
@property (nonatomic, assign) BOOL isRefresh;

@end


@implementation PPSRefreshHeader

+ (PPSRefreshHeader *)headerWithScrollView:(UIScrollView *)scrollView RefreshingAction:(PPSRefreshHeaderBlock)actionBlock
{
    PPSRefreshHeader *refreshHeader = [[PPSRefreshHeader alloc] init];
    refreshHeader.beginRefreshingBlock = actionBlock;
    [refreshHeader initConfigWithScrollView:scrollView];
    
    return refreshHeader;
}

- (void)initConfigWithScrollView:(UIScrollView *)scrollView
{
    self.isRefresh = NO;
    self.lastPosition = 0;
    self.headerHeight = 35;
    float imageWidth = 13;
    float imageHeight = self.headerHeight;
    float labelWidth = 130;
    float labelHeight = self.headerHeight;
    
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, -self.headerHeight - 10, scrollView.frame.size.width, self.headerHeight)];
    [scrollView addSubview:self.headerView];
    
    self.headerLabel = [[UILabel alloc] initWithFrame:CGRectMake((scrollView.frame.size.width - labelWidth)/2, 0, labelWidth, labelHeight)];
    [self.headerView addSubview:self.headerLabel];
    self.headerLabel.textAlignment=NSTextAlignmentCenter;
    self.headerLabel.text=@"下拉可刷新";
    self.headerLabel.font=[UIFont systemFontOfSize:14];
    
    self.headerIV = [[UIImageView alloc] initWithFrame:CGRectMake((scrollView.frame.size.width -  labelWidth)/2 - imageWidth, 0, imageWidth, imageHeight)];
    [self.headerView addSubview:self.headerIV];
    self.headerIV.image=[UIImage imageNamed:@"down"];
    
    self.activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.activityView.frame = CGRectMake((scrollView.frame.size.width - labelWidth)/2-imageWidth, 0, imageWidth, self.headerHeight);
    [self.headerView addSubview:self.activityView];
    
    self.activityView.hidden = YES;
//    self.headerIV.hidden = YES;
    

    [scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

- (void)header{

}

//当属性的值发生变化时，自动调用此方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (![@"contentOffset" isEqualToString:keyPath]) return;
    
    UIScrollView *scrollView = (UIScrollView *)object;
    //    获取_scrollView的contentSize
    self.contentHeight = scrollView.contentSize.height;

    //    判断是否在拖动_scrollView
    if (scrollView.dragging)
    {

        int currentPostion = scrollView.contentOffset.y;
        DLog(@"%d", currentPostion);
        //        判断是否正在刷新  否则不做任何操作
        if (!self.isRefresh)
        {
            [UIView animateWithDuration:0.3 animations:^{
                //                当currentPostion 小于某个值时 变换状态
                if (currentPostion < -self.headerHeight*1.5)
                {

                    self.headerLabel.text=@"松开以刷新";
                    self.headerIV.transform = CGAffineTransformMakeRotation(M_PI);

                }
                else
                {
                    int currentPostion = scrollView.contentOffset.y;
                    //                    判断滑动方向 以让“松开以刷新”变回“下拉可刷新”状态
                    if (currentPostion - self.lastPosition > 5)
                    {
                        self.lastPosition = currentPostion;
                        self.headerIV.transform = CGAffineTransformMakeRotation(M_PI*2);

                        self.headerLabel.text=@"下拉可刷新";
                    }
                    else if (self.lastPosition - currentPostion > 5)
                    {
                        self.lastPosition = currentPostion;
                    }
                }
            }];
        }

    }
    else
    {
        //        进入刷新状态
        if ([self.headerLabel.text isEqualToString:@"松开以刷新"])
        {
            [self beginRefreshing];
        }
    }
}

//开始刷新操作  如果正在刷新则不做操作
-(void)beginRefreshing
{
    if (!self.isRefresh)
    {

        self.isRefresh = YES;
        self.headerLabel.text=@"正在载入…";
        self.headerIV.hidden=YES;
        self.activityView.hidden=NO;
        [self.activityView startAnimating];

        //        设置刷新状态_scrollView的位置
        [UIView animateWithDuration:0.3 animations:^{
//            _scrollView.contentInset=UIEdgeInsetsMake(headerHeight*1.5, 0, 0, 0);
        }];

        //        block回调
        self.beginRefreshingBlock();
    }

}

//关闭刷新操作

- (void)endRefreshing
{
    self.isRefresh = NO;

    dispatch_async(dispatch_get_main_queue(), ^{

        [UIView animateWithDuration:0.3 animations:^{
//            _scrollView.contentInset=UIEdgeInsetsMake(0, 0, 0, 0);
            self.headerIV.hidden=NO;
            self.headerIV.transform = CGAffineTransformMakeRotation(M_PI*2);
            [self.activityView stopAnimating];
            self.activityView.hidden=YES;
        }];
    });
}


- (void)dealloc
{
//    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];

}

@end
