//
//  PPSFreelyViewController.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/9/18.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSFreelyViewController.h"
#import "PPSFreelyTableViewDelegate.h"
#import "PPSFreelyTableViewDatasource.h"
#import "PPSFreelyWordTableViewCell.h"
#import "PPSFreelyAudioTableViewCell.h"
#import "PPSFreelyReadViewController.h"
#import "PPSFreelyViewModel.h"
#import "PPSFreelyAudioViewController.h"


@interface PPSFreelyViewController ()

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) PPSFreelyViewModel *freelyViewModel;
@property (nonatomic, strong) PPSFreelyTableViewDelegate *tableViewDelegate;
@property (nonatomic, strong) PPSFreelyTableViewDatasource *tableViewDatasource;

@end

@implementation PPSFreelyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView = tableView;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:PPSFreelyTableViewCellID];
    UINib *wordNib = [UINib nibWithNibName:@"PPSFreelyWordTableViewCell" bundle:nil];
    [tableView registerNib:wordNib forCellReuseIdentifier:PPSFreelyWordTableViewCellID];
    UINib *audioNib = [UINib nibWithNibName:@"PPSFreelyAudioTableViewCell" bundle:nil];
    [tableView registerNib:audioNib forCellReuseIdentifier:PPSFreelyAudioTableViewCellID];
    [self.view addSubview:tableView];
    
    // 自定义 tableView 的代理，进一步拆分业务
    self.tableViewDelegate = [[PPSFreelyTableViewDelegate alloc] init];
    self.tableViewDelegate.titleArray = self.titleArray;
    __weak typeof(self) weakself = self;
    self.tableViewDelegate.selectBlock = ^(NSString *titleStr){
        PPSFreelyReadViewController *readVC = [[PPSFreelyReadViewController alloc] init];
        readVC.docName = titleStr;
        readVC.title = titleStr;
        readVC.hidesBottomBarWhenPushed = YES;
        __strong typeof(weakself) strongself = weakself;
        [strongself.navigationController pushViewController:readVC animated:YES];
    };
    self.tableViewDelegate.audioSelectBlock = ^(NSString *titleStr){
        PPSFreelyAudioViewController *audioVC = [[PPSFreelyAudioViewController alloc] init];
        audioVC.audioName = titleStr;
        audioVC.title = titleStr;
        audioVC.hidesBottomBarWhenPushed = YES;
        __strong typeof(weakself) strongself = weakself;
        [strongself.navigationController pushViewController:audioVC animated:YES];
    };
    
    self.tableViewDatasource = [[PPSFreelyTableViewDatasource alloc] init];
    self.tableViewDatasource.dataArray = self.dataArray;
    
    self.tableView.delegate = self.tableViewDelegate;
    self.tableView.dataSource = self.tableViewDatasource;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(freelyPreviewShare:) name:FreelyPreviewShare object:nil];
}

- (void)freelyPreviewShare:(NSNotification *)notifi
{
    
}

#pragma mark - 懒加载
- (NSArray *)dataArray
{
    if (!_dataArray)
    {
        NSMutableArray *tempAry = [[NSMutableArray alloc] init];
        
        for (int i = 2009; i < 2018; i++) {
            [tempAry addObject:[[[NSString alloc] initWithFormat:@"%d", i] stringByAppendingString:@"年下"]];
            [tempAry addObject:[[[NSString alloc] initWithFormat:@"%d", i] stringByAppendingString:@"年上"]];
        }
        
        _dataArray = [[NSArray alloc] initWithObjects:[[tempAry reverseObjectEnumerator] allObjects], @[@"古代奇案001", @"古代奇案002", @"古代奇案003"], @[@"文字分享"], @[@"音频分享"], nil];
    }
    return _dataArray;
}

- (NSArray *)titleArray
{
    if (!_titleArray)
    {
        _titleArray = @[@"软考", @"评书", @"文字", @"音频"];
    }
    return _titleArray;
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
