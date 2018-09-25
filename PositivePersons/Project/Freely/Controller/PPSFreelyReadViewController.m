//
//  PPSFreelyReadViewController.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/9/23.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSFreelyReadViewController.h"

@interface PPSFreelyReadViewController ()

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation PPSFreelyReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *documentPath = [[NSBundle mainBundle] pathForResource:self.docName ofType:@"docx"];
    NSLog(@"%@", documentPath);
    NSURL *url = [NSURL fileURLWithPath:documentPath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    

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
