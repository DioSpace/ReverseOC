//
//  HookTargetVC.m
//  ReverseOC
//
//  Created by lzd_free on 2020/12/30.
//

#import "HookTargetVC.h"

@interface HookTargetVC ()

@property (weak, nonatomic) IBOutlet UILabel *show;

@end

@implementation HookTargetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_show sizeToFit];
    _show.preferredMaxLayoutWidth = ScreenWidth - 20;
}

-(NSString *)ordinaryFunc:(NSString *)str {
    NSString *value = [NSString stringWithFormat:@"origin return value! str = %@",str];
    return value;
}

- (IBAction)ordinaryAction:(UIButton *)sender {
    NSString *result = [self ordinaryFunc:@"test str"];
    [_show setText:result];
}

@end
