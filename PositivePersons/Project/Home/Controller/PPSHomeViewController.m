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
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView = tableView;
    [self.view addSubview:self.tableView];
    
    self.homeTableViewModel = [[PPSHomeTableViewModel alloc] init];
    
    self.tableViewDelegate = [[PPSHomeTableViewDelegate alloc] init];
    self.tableViewDatasource = [[PPSHomeTableViewDatasource alloc] init];
    self.tableView.delegate = self.tableViewDelegate;
    self.tableView.dataSource = self.tableViewDatasource;
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
