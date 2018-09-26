//
//  PPSFreelyAudioViewController.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/9/26.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSFreelyAudioViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface PPSFreelyAudioViewController ()

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) AVAudioSession *audioSession;

@end

@implementation PPSFreelyAudioViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

- (void)setAudioName:(NSString *)audioName
{
    _audioName = audioName;
    
    // 加载音频
    NSString *mp3Path = [[NSBundle mainBundle] pathForResource:self.audioName ofType:@"mp3"];
    NSError *error;
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:mp3Path] error:&error];
    self.audioPlayer = audioPlayer;
    audioPlayer.numberOfLoops = 0;
    audioPlayer.volume = 0.8;
    [audioPlayer prepareToPlay];
    BOOL success = [audioPlayer play];
    NSLog(@"%d", success);
    
    // 后台播放；同时打开 Capabilities
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    self.audioSession = audioSession;
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    [audioSession setActive:YES error:nil];
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
