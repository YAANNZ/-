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
#import <AVFoundation/AVFoundation.h>

@interface PPSFreelyViewController ()

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) AVAudioSession *audioSession;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *dataArray;


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
    self.tableViewDatasource = [[PPSFreelyTableViewDatasource alloc] init];
    self.tableViewDatasource.dataArray = self.dataArray;
    self.tableView.delegate = self.tableViewDelegate;
    self.tableView.dataSource = self.tableViewDatasource;
    
    
    
    // 加载音频
    NSString *mp3Path = [[NSBundle mainBundle] pathForResource:@"001" ofType:@"mp3"];
    NSError *error;
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:mp3Path] error:&error];
//    self.audioPlayer = audioPlayer;
//    audioPlayer.numberOfLoops = 0;
    //    audioPlayer.volume = 0.8;
//    [audioPlayer prepareToPlay];
//    BOOL success = [audioPlayer play];
//    NSLog(@"%d", success);
    
    // 后台播放；同时打开 Capabilities
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    self.audioSession = audioSession;
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    [audioSession setActive:YES error:nil];
}

#pragma mark - 懒加载
- (NSArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = @[@[@"2017", @"2016", @"2015"], @[@"001", @"002", @"003"], @[@"文字分享"], @[@"音频分享"]];
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
