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
#import "PPSRefreshHeader.h"

@interface PPSHomeViewController ()

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) PPSInputTaskView *inputTaskView;
@property (nonatomic, strong) PPSClockView *clockView;
@property (nonatomic, strong) PPSHomeTableViewModel *homeTableViewModel;
@property (nonatomic, strong) PPSHomeTableViewDelegate *tableViewDelegate;
@property (nonatomic, strong) PPSHomeTableViewDatasource *tableViewDatasource;
@property (nonatomic, strong) PPSRefreshHeader *refreshHeader;

@end

@implementation PPSHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Now" style:UIBarButtonItemStyleDone target:self action:@selector(startClock)];
    rightBarButtonItem.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    // UI 初始化
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView = tableView;
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.tableView];
    
    // ViewModel - 处理数据和业务
    self.homeTableViewModel = [[PPSHomeTableViewModel alloc] init];
    
    // 自定义 tableView 的代理，进一步拆分业务
    self.tableViewDelegate = [[PPSHomeTableViewDelegate alloc] init];
    self.tableViewDatasource = [[PPSHomeTableViewDatasource alloc] init];
    self.tableView.delegate = self.tableViewDelegate;
    self.tableView.dataSource = self.tableViewDatasource;
    
    // 显示本地数据
    [self.homeTableViewModel requestSqliteData];

    // 下拉刷新
//    __weak typeof(self) weakself = self;
//    self.refreshHeader = [PPSRefreshHeader headerWithScrollView:self.tableView RefreshingAction:^{
//        __strong typeof(self) strongself = weakself;
//        [strongself.homeTableViewModel headerRefreshRequest];
//    }];
    
    // 接收 viewModel 对数据处理后的反馈，调整 UI
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView:) name:PPSHomeTableViewNeedReload object:self.homeTableViewModel];
    
//    dispatch_queue_t concurrent = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(concurrent, ^{
//        NSLog(@"0000");
//        dispatch_async(concurrent, ^{
//            NSLog(@"1111");
//        });
//        NSLog(@"2222");
//    });
//    NSLog(@"3333");
    
//    dispatch_queue_t concurrent = dispatch_queue_create("tests", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(concurrent, ^{
//        NSLog(@"%@", [NSThread currentThread]);
//        dispatch_sync(concurrent, ^{
//            NSLog(@"%@", [NSThread currentThread]);
//        });
//    });
    
}

- (void)reloadTableView:(NSNotification *)notification
{
    NSLog(@"%@", notification.userInfo);
    NSLog(@"%@", notification.object);
    
    NSDictionary *resultDict = notification.userInfo;
    if ([resultDict[StateCode] integerValue] == 0)
    {
        self.tableViewDatasource.dataArray = notification.object;
        [self.tableView reloadData];
    }
    else
    {
//        show(resultDict[ErrorLocalDiscription]);
    }
}


#pragma mark - events
- (void)addTask
{
    self.inputTaskView.hidden = NO;
}

- (void)startClock
{
    self.clockView.hidden = NO;
}

#pragma mark - 懒加载
- (PPSInputTaskView *)inputTaskView
{
    if (!_inputTaskView)
    {
        _inputTaskView = [[PPSInputTaskView alloc] init];
        _inputTaskView.frame = CGRectMake(60, (MAINSCREEN_HEIGHT - 190)/2, MAINSCREEN_WIDTH-120, 190);
        _inputTaskView.delegate = self.homeTableViewModel;
        [self.view addSubview:_inputTaskView];
    }
    
    return _inputTaskView;
}

- (PPSClockView *)clockView
{
    if (!_clockView)
    {
        _clockView = [[PPSClockView alloc] init];
        _clockView.frame = CGRectMake((MAINSCREEN_WIDTH-120)/2, (MAINSCREEN_HEIGHT - 80)/2, 120, 80);
        _clockView.delegate = self.homeTableViewModel;
        [self.view addSubview:_clockView];
    }
    
    return _clockView;
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
