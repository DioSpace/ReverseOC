//
//  AppDelegate.m
//  ReverseOC
//
//  Created by lzd_free on 2020/12/25.
//

#import "AppDelegate.h"
#import "MyTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blueColor];
    [self.window makeKeyAndVisible];
    MyTabBarController *tabBarCtrl = [[MyTabBarController alloc] init];
    self.window.rootViewController = tabBarCtrl;
    return YES;
}

@end
