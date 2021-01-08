//
//  ProxyViewController.m
//  ReverseOC
//
//  Created by lzd_free on 2020/12/25.
//

#import "ProxyViewController.h"
#import <SystemConfiguration/CaptiveNetwork.h>

@interface ProxyViewController ()

@property (weak, nonatomic) IBOutlet UILabel *showLB;

@end

@implementation ProxyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _showLB.preferredMaxLayoutWidth = ScreenWidth - 20;
    [_showLB sizeToFit];
}

- (IBAction)wifiInfo:(id)sender {
    id result = [self fetchSSIDInfo];
    NSLog(@"%@",result);
}
- (id)fetchSSIDInfo {
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    NSLog(@"Supported interfaces: %@", ifs);
    id info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        NSLog(@"%@ => %@", ifnam, info);
        if (info && [info count]) { break; }
    }
    return info;
}

- (IBAction)checkProxy:(UIButton *)sender {
    BOOL result = [self getProxyStatus];
    if (result) {
        _showLB.text = [NSString stringWithFormat:@"有代理"];
    }else{
        _showLB.text = [NSString stringWithFormat:@"无代理"];
    }
}

- (BOOL)getProxyStatus {
    NSDictionary *proxySettings =  (__bridge NSDictionary *)(CFNetworkCopySystemProxySettings());
    NSArray *proxies = (__bridge NSArray *)(CFNetworkCopyProxiesForURL((__bridge CFURLRef _Nonnull)([NSURL URLWithString:@"http://www.baidu.com"]), (__bridge CFDictionaryRef _Nonnull)(proxySettings)));
    NSDictionary *settings = [proxies objectAtIndex:0];
    
    NSLog(@"host=%@", [settings objectForKey:(NSString *)kCFProxyHostNameKey]);
    NSLog(@"port=%@", [settings objectForKey:(NSString *)kCFProxyPortNumberKey]);
    NSLog(@"type=%@", [settings objectForKey:(NSString *)kCFProxyTypeKey]);
    
    if ([[settings objectForKey:(NSString *)kCFProxyTypeKey] isEqualToString:@"kCFProxyTypeNone"]){
        //没有设置代理
        return NO;
    }else{
        //设置代理了
        return YES;
    }
}


@end
