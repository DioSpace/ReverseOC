//
//  MyTabBarController.m
//  TabBarController
//
//  Created by William on 2018/10/19.
//  Copyright © 2018年 William. All rights reserved.
//

#import "MyTabBarController.h"
#import "MyNavgationController.h"
#import "DeviceViewController.h"
#import "NetworkViewController.h"
#import "HookViewController.h"
#import "OtherViewController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器
    [self addOneViewController:[[DeviceViewController alloc] init] image:@"tab_home_normal" selectedImage:@"tab_home_50" title:@"Device"];
    [self addOneViewController:[[NetworkViewController alloc] init] image:@"tab_c2c_normal" selectedImage:@"tab_c2c_50" title:@"Network"];
    [self addOneViewController:[[HookViewController alloc] init] image:@"tab_team_normal" selectedImage:@"tab_team_50" title:@"Hook"];
    [self addOneViewController:[[OtherViewController alloc] init] image:@"tab_mine_normal" selectedImage:@"tab_mine_50" title:@"Other"];
}

//添加一个子控制器的方法
- (void)addOneViewController:(UIViewController *)childViewController image:(NSString *)imageName selectedImage:(NSString *)selectedImageName title:(NSString *)title {
    MyNavgationController *nav = [[MyNavgationController alloc] initWithRootViewController:childViewController];
    
    // 设置图片和文字之间的间距
    nav.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    nav.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -4);
    
    // 1.1.1 设置tabBar文字
    nav.tabBarItem.title = title;
    // 1.1.2 设置正常状态下的图标
    if (imageName.length) { // 图片名有具体
        nav.tabBarItem.image =  [self oriRenderingImage:imageName];//[UIImage imageWithOriRenderingImage:imageName];
        // 1.1.3 设置选中状态下的图标
        nav.tabBarItem.selectedImage = [self oriRenderingImage:selectedImageName];//[UIImage imageWithOriRenderingImage:selectedImageName];
    }
    
    // 1.1.5 添加tabBar为控制器的子控制器
    [self addChildViewController:nav];
}
//获取原始图片
-(UIImage *)oriRenderingImage:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
