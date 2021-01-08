//
//  ReverseCodeVC.m
//  ReverseOC
//
//  Created by lzd_free on 2020/12/27.
//

#import "ReverseCodeVC.h"

@interface ReverseCodeVC ()

@end

@implementation ReverseCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //读取文件前n个字节
//    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:@"/xxx/xx"];
//    NSData *data = [handle readDataOfLength:10];
//    [handle closeFile];
}

- (IBAction)getKeyWindow:(UIButton *)sender {
    UIWindow *window = nil;
    if (@available(iOS 13.0, *)){
        for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes){
            if (windowScene.activationState == UISceneActivationStateForegroundActive){
                window = windowScene.windows.firstObject;
                break;
            }
        }
    }else{
        window = [UIApplication sharedApplication].keyWindow;
    }
    NSLog(@"window : \n%@", window.rootViewController);
//    [self.view recursiveDescription];
    
//    NSLog(@"%@",[window recur]);
}

@end
