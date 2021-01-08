//
//  DeviceIDViewController.m
//  ReverseOC
//
//  Created by lzd_free on 2020/12/25.
//

#import "DeviceIDViewController.h"
#import "BGKeychainTool.h"

@interface DeviceIDViewController ()

@end

@implementation DeviceIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)getUUID:(UIButton *)sender {
    NSString *uuid = [BGKeychainTool getDeviceIDInKeychain];
    NSLog(@"uuid : %@",uuid);
}

@end
