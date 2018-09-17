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
#import "WXApi.h"
#import <AVFoundation/AVFoundation.h>

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
//    UIScrollView *scrollView = [[UIScrollView alloc] init];
//    self.scrollView = scrollView;
//    scrollView.backgroundColor = [UIColor brownColor];
//    [self.view addSubview:scrollView];
//
//    UILabel *trendLabel = [[UILabel alloc] init];
//    trendLabel.backgroundColor = [UIColor lightGrayColor];
//    trendLabel.text = @"Trend";
//    trendLabel.textAlignment = NSTextAlignmentLeft;
//    [scrollView addSubview:trendLabel];
//
//    PPSTrendView *trendView = [[PPSTrendView alloc] init];
//    [scrollView addSubview:trendView];
//
//    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@64);
//        make.left.right.equalTo(@0);
//        make.bottom.equalTo(@-49);
//    }];
//
//    [trendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.equalTo(@0);
//        make.height.equalTo(@30);
//        make.width.equalTo(scrollView.mas_width);
//    }];
//
//    [trendView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(trendLabel.mas_bottom).offset(0);
//        make.left.equalTo(@0);
//        make.width.equalTo(scrollView.mas_width);
//        make.height.mas_equalTo(200.0/300.0*(MAINSCREEN_WIDTH - 40));
//    }];
//
//    /* viewModel */
//    self.analysisViewModel = [[PPSAnalysisViewModel alloc] init];
//    trendView.delegate = self.analysisViewModel;
//
//    [self.analysisViewModel requesTrendViewDataWithCallback:^(NSArray *array, BOOL isSuccess, NSString *errorStr) {
//        trendView.dataArray = array;
//    }];
    
    // 分享文字
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.numberOfLines = 0;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 6;
    paragraphStyle.firstLineHeadIndent = 2*16;
    NSDictionary *attributeDic = @{
                                   NSFontAttributeName : [UIFont systemFontOfSize:16],
                                   NSParagraphStyleAttributeName : paragraphStyle,
                                   NSForegroundColorAttributeName : [UIColor blackColor]
                                   };
    textLabel.attributedText = [[NSAttributedString alloc] initWithString:@"换乘 13 号线的乘客请在芍药居站下车，换乘站客流量大，请您提前换到车门处，文明有序换乘。" attributes:attributeDic];
    [self.view addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
        make.centerX.equalTo(@0);
        make.top.mas_equalTo(self.view.height/2 - 45);
    }];
    
    // 分享音频
    UILabel *titleTextLabel = [[UILabel alloc] init];
    titleTextLabel.numberOfLines = 0;
    NSMutableParagraphStyle *titleParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    titleParagraphStyle.lineSpacing = 6;
    titleParagraphStyle.firstLineHeadIndent = self.view.width - 10*16;
    NSDictionary *titleAttributeDic = @{
                                        NSFontAttributeName : [UIFont systemFontOfSize:16],
                                        NSParagraphStyleAttributeName : titleParagraphStyle,
                                        NSForegroundColorAttributeName : [UIColor blackColor]
                                        };
    titleTextLabel.attributedText = [[NSAttributedString alloc] initWithString:@"---《樱花东街》" attributes:titleAttributeDic];
    [self.view addSubview:titleTextLabel];
    [titleTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
        make.centerX.equalTo(@0);
        make.top.equalTo(textLabel.mas_bottom).equalTo(@20);
    }];
    
    // 加载音频
    NSString *mp3Path = [[NSBundle mainBundle] pathForResource:@"001" ofType:@"mp3"];
    NSError *error;
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:mp3Path] error:&error];
    audioPlayer.numberOfLoops = 0;
    audioPlayer.volume = 0.8;
    [audioPlayer prepareToPlay];
    BOOL success = [audioPlayer play];
    NSLog(@"%d", success);
    
    // 后台播放；同时打开 Capabilities
    AVAudioSession *audioSession=[AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    [audioSession setActive:YES error:nil];

}

// 分享 // https://www.jianshu.com/p/9215f8860af5
- (void)sharePage
{
    WXMediaMessage *message = [WXMediaMessage message];
    WXImageObject *imageObject = [WXImageObject object];
    imageObject.imageData = UIImageJPEGRepresentation([self snapshotWithCapInsets:UIEdgeInsetsZero], 1.0);
    message.mediaObject = imageObject;
    
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = WXSceneTimeline;
    [WXApi sendReq:req];
}

- (UIImage *)snapshotWithCapInsets:(UIEdgeInsets)capInsets
{
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, [UIScreen mainScreen].scale);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:currentContext];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
                                           
    UIImageView *snapshotView = [[UIImageView alloc] initWithFrame:self.view.frame];
    snapshotView.image = [snapshotImage resizableImageWithCapInsets:capInsets];
    return snapshotView.image;
}

- (void)upload
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"米店";
    message.description = @"三月的烟雨，飘摇的南方，你坐在你空空的米店...";
    [message setThumbImage:[UIImage imageNamed:@"midian"]];
    
    WXMusicObject *musicObject = [WXMusicObject object];
    musicObject.musicUrl = @"";
    message.mediaObject = musicObject;
    
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = WXSceneTimeline;
    [WXApi sendReq:req];
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
