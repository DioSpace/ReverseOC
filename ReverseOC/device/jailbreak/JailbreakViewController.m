//
//  JailbreakViewController.m
//  ReverseOC
//
//  Created by lzd_free on 2020/12/26.
//

#import "JailbreakViewController.h"
#import "JailbreakTool.h"

@interface JailbreakViewController ()

@property (weak, nonatomic) IBOutlet UILabel *show;

@end

@implementation JailbreakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_show sizeToFit];
}

- (IBAction)jailbreak_check:(UIButton *)sender {
    BOOL isOr = [JailbreakTool isJailbroken];
    NSString *result = nil;
    if (isOr) {
        result = @"已经越狱";
    }else{
        result = @"没有越狱";
    }
    _show.text = result;
}


@end
