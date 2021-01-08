//
//  MyNavgationController.m
//  TabBarController
//
//  Created by William on 2018/10/16.
//  Copyright © 2018年 William. All rights reserved.
//

#import "MyNavgationController.h"

@interface MyNavgationController ()

@end

@implementation MyNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //1. 取出分栏
    UITabBar *tabBar = self.tabBarController.tabBar;
    
    // 将frame左移分栏的宽度
    CGRect frame = tabBar.frame;
    frame.origin.x -= tabBar.frame.size.width;
    
    // 动画影藏tabBar
    [UIView animateWithDuration:0.28 animations:^{
        tabBar.frame = frame;
    }];
    
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    //1. 取出分栏
    UITabBar *tabBar = self.tabBarController.tabBar;
    
    // 将frame左移分栏的宽度
    CGRect frame = tabBar.frame;
    frame.origin.x += tabBar.frame.size.width;
    
    // 动画影藏tabBar
    [UIView animateWithDuration:0.28 animations:^{
        tabBar.frame = frame;
    }];
    
    return [super popViewControllerAnimated:YES];
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
