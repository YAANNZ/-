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

@property (nonatomic, weak) UIScrollView *scrollView;
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
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"share_unsel"] style:UIBarButtonItemStyleDone target:self action:@selector(sharePage)];
    
    /* view */
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    scrollView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:scrollView];
    
    UILabel *trendLabel = [[UILabel alloc] init];
    trendLabel.backgroundColor = [UIColor lightGrayColor];
    trendLabel.text = @"Trend";
    trendLabel.textAlignment = NSTextAlignmentLeft;
    [scrollView addSubview:trendLabel];
    
    PPSTrendView *trendView = [[PPSTrendView alloc] init];
    [scrollView addSubview:trendView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@64);
        make.left.right.equalTo(@0);
        make.bottom.equalTo(@-49);
    }];
    
    [trendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@0);
        make.height.equalTo(@30);
        make.width.equalTo(scrollView.mas_width);
    }];
    
    [trendView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(trendLabel.mas_bottom).offset(0);
        make.left.equalTo(@0);
        make.width.equalTo(scrollView.mas_width);
        make.height.mas_equalTo(200.0/300.0*(MAINSCREEN_WIDTH - 40));
    }];
    
    /* viewModel */
    self.analysisViewModel = [[PPSAnalysisViewModel alloc] init];
    trendView.delegate = self.analysisViewModel;
    
    [self.analysisViewModel requesTrendViewDataWithCallback:^(NSArray *array, BOOL isSuccess, NSString *errorStr) {
        trendView.dataArray = array;
    }];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    webView.scalesPageToFit = YES;
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"free_resume" ofType:@"html" inDirectory:@"awesomeResume/free"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

// 分享 // https://www.jianshu.com/p/9215f8860af5
- (void)sharePage
{
//    UIImageView *imgView = [[UIImageView alloc] initWithImage:[self snapshotWithCapInsets:UIEdgeInsetsMake(0, 0, 0, -113)]];
//    imgView.backgroundColor = [UIColor brownColor];
//    imgView.frame = CGRectMake(0, 0, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT);
//    [[[UIApplication sharedApplication] keyWindow] addSubview:imgView];
}

- (UIImage *)snapshotWithCapInsets:(UIEdgeInsets)capInsets
{
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, [UIScreen mainScreen].scale);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    [self.scrollView.layer renderInContext:currentContext];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
                                           
    UIImageView *snapshotView = [[UIImageView alloc] initWithFrame:self.view.frame];
    snapshotView.image = [snapshotImage resizableImageWithCapInsets:capInsets];
    return snapshotView.image;
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
