//
//  PPSOptionsViewController.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/16.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSOptionsViewController.h"
#import "PPSRefreshHeader.h"
#import "PPSRefreshFooter.h"
#import "PPSOptionsTableViewModel.h"
#import "PPSOptionsTableViewDelegate.h"
#import "PPSOptionsTableViewDataSource.h"

@interface PPSOptionsViewController ()

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) PPSRefreshHeader *refreshHeader;
@property (nonatomic, strong) PPSRefreshFooter *refreshFooter;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) PPSOptionsTableViewModel *tableViewModel;
@property (nonatomic, strong) PPSOptionsTableViewDataSource *tableViewDataSource;
@property (nonatomic, strong) PPSOptionsTableViewDelegate *tableViewDelegate;

@end

@implementation PPSOptionsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    // 1.初始化
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    // 2.数据和业务的分离
    self.tableViewModel = [[PPSOptionsTableViewModel alloc] init];
    
    // 3.代理事件相关数据及业务的进一步分离
    self.tableViewDelegate = [[PPSOptionsTableViewDelegate alloc] init];
    self.tableView.delegate = self.tableViewDelegate;
    self.tableViewDataSource = [[PPSOptionsTableViewDataSource alloc] init];
    self.tableView.dataSource = self.tableViewDataSource;
    
    //    YiRefreshHeader  头部刷新按钮的使用
//    self.refreshHeader = [[PPSRefreshHeader alloc] init];
//    self.refreshHeader.scrollView = self.tableView;
//    [self.refreshHeader header];
//    __weak typeof(self) weakSelf = self;
//    refreshHeader.beginRefreshingBlock=^(){
//        __strong typeof(self) strongSelf = weakSelf;
//        [strongSelf headerRefreshAction];
//    };
//    
//    //    是否在进入该界面的时候就开始进入刷新状态
//    [refreshHeader beginRefreshing];
//
//    //    YiRefreshFooter  底部刷新按钮的使用
//    refreshFooter=[[YiRefreshFooter alloc] init];
//    refreshFooter.scrollView=tableView;
//    [refreshFooter footer];
//
//    refreshFooter.beginRefreshingBlock=^(){
//        __strong typeof(self) strongSelf = weakSelf;
//        [strongSelf footerRefreshAction];
//    };
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
