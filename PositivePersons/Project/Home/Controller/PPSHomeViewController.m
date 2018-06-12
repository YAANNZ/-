//
//  PPSHomeViewController.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/17.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSHomeViewController.h"
#import "PPSHomeTableViewDelegate.h"
#import "PPSHomeTableViewDatasource.h"
#import "PPSHomeTableViewModel.h"

@interface PPSHomeViewController ()

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) PPSHomeTableViewModel *homeTableViewModel;
@property (nonatomic, strong) PPSHomeTableViewDelegate *tableViewDelegate;
@property (nonatomic, strong) PPSHomeTableViewDatasource *tableViewDatasource;

@end

@implementation PPSHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // UI 初始化
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView = tableView;
    [self.view addSubview:self.tableView];
    
    // ViewModel--处理数据和业务
    self.homeTableViewModel = [[PPSHomeTableViewModel alloc] init];
    
    // 自定义tableView的代理，进一步拆分业务
    self.tableViewDelegate = [[PPSHomeTableViewDelegate alloc] init];
    self.tableViewDatasource = [[PPSHomeTableViewDatasource alloc] init];
    self.tableView.delegate = self.tableViewDelegate;
    self.tableView.dataSource = self.tableViewDatasource;
    
    // 获取数据源
    [self.homeTableViewModel headerRefreshRequestWithCallback:^(NSArray *array, BOOL isSuccess, NSString *errorStr) {
        self.tableViewDatasource.dataArray = array;
        [self.tableView reloadData];
    }];
}





/*
 那时我们有梦，关于文学，关于爱情，关于穿越世界的旅行。如今我们深夜饮酒，杯子碰到一起，都是梦破碎的声音。
 */



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
