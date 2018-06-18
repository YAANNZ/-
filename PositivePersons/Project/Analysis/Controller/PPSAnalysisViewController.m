//
//  PPSAnalysisViewController.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/6/17.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSAnalysisViewController.h"

@interface PPSAnalysisViewController ()

@end

@implementation PPSAnalysisViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:@"" style:UIBarButtonItemStyleDone target:self action:@selector(sharePage)];
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
