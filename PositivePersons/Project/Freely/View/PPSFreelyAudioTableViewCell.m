//
//  PPSFreelyAudioTableViewCell.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/9/22.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSFreelyAudioTableViewCell.h"
#import "WXApi.h"

@implementation PPSFreelyAudioTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)shareAudio:(UIButton *)sender {
    
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"米店";
    message.description = @"三月的烟雨，飘摇的南方，你坐在你空空的米店...";
    [message setThumbImage:[UIImage imageNamed:@"midian"]];
    
    WXMusicObject *musicObject = [WXMusicObject object];
    musicObject.musicUrl = @"http://7xs8ec.com1.z0.glb.clouddn.com/%E8%91%A3%E5%B0%8F%E5%A7%90%E4%BC%B4%E5%A5%8F.m4a";
    message.mediaObject = musicObject;
    
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = WXSceneTimeline;
    [WXApi sendReq:req];
}

@end
