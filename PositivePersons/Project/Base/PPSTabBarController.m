//
//  PPSTabBarController.m
//  PositivePersons
//
//  Created by ZHUYN on 2018/5/18.
//  Copyright © 2018年 zynabc. All rights reserved.
//

#import "PPSTabBarController.h"
#import "PPSHomeViewController.h"
#import "PPSOptionsViewController.h"

@interface PPSTabBarController ()

@end

@implementation PPSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewControllers];
}

- (void)addChildViewControllers
{
    PPSHomeViewController *homeVC = [[PPSHomeViewController alloc] init];
    [self setupOneChildViewController:homeVC Title:@"Home" normalImg:[UIImage imageNamed:@"Home_unselect"] selImg:[UIImage imageNamed:@"Home_select"]];
    
    PPSOptionsViewController *optionsVc = [[PPSOptionsViewController alloc] init];
    [self setupOneChildViewController:optionsVc Title:@"Options" normalImg:[UIImage imageNamed:@"Options_unselect"] selImg:[UIImage imageNamed:@"Options_select"]];
}

- (void)setupOneChildViewController:(UIViewController *)childVc Title:(NSString *)title normalImg:(UIImage *)normalImg selImg:(UIImage *)selImg
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName : [UIFont systemFontOfSize:19.f],
                                     NSForegroundColorAttributeName : [UIColor whiteColor]
                                     };
    [childVc.navigationController.navigationBar setTitleTextAttributes:textAttributes];
    
    [childVc.tabBarItem setTitleTextAttributes:@{
                                                 NSForegroundColorAttributeName : [UIColor colorWithRed:40/255.0 green:111/255.0 blue:173/255.0 alpha:1.0]
                                                 } forState:UIControlStateSelected];
    childVc.title = title;
    childVc.tabBarItem.image = normalImg;
    childVc.tabBarItem.selectedImage = selImg;
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
