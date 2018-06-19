//
//  PPSAnalysisViewController.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/6/17.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSAnalysisViewController.h"
#import "PPSBlogViewController.h"
#import "PPSAnalysisViewModel.h"
#import "PPSTrendView.h"

@interface PPSAnalysisViewController ()

@property (nonatomic, strong) PPSAnalysisViewModel *analysisViewModel;

@end

@implementation PPSAnalysisViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupSubviews];
}

- (void)setupSubviews
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"share_unsel"] style:UIBarButtonItemStyleDone target:self action:@selector(sharePage)];
    
    UILabel *trendLabel = [[UILabel alloc] init];
    trendLabel.text = @"Trend";
    trendLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:trendLabel];
    
    self.analysisViewModel = [[PPSAnalysisViewModel alloc] init];
    
    PPSTrendView *trendView = [[PPSTrendView alloc] init];
    trendView.delegate = self.analysisViewModel;
    [self.view addSubview:trendView];
}

// 分享
- (void)sharePage
{
    
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
