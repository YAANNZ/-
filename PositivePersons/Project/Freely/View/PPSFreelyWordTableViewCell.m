//
//  PPSFreelyWordTableViewCell.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/9/22.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSFreelyWordTableViewCell.h"

@interface PPSFreelyWordTableViewCell ()

@property (strong, nonatomic) IBOutlet UITextView *titleTextView;
@property (strong, nonatomic) IBOutlet UITextField *subtitleTextField;


@end

@implementation PPSFreelyWordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)previewShare:(UIButton *)sender {
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[@"title"] = self.titleTextView.text;
    userInfo[@"subtitle"] = self.subtitleTextField.text;
    [[NSNotificationCenter defaultCenter] postNotificationName:FreelyPreviewShare object:nil userInfo:userInfo];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
