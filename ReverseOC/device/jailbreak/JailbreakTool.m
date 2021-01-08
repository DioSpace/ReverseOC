//
//  JailbreakTool.m
//  ReverseOC
//
//  Created by lzd_free on 2020/12/26.
//

#import "JailbreakTool.h"

@implementation JailbreakTool

+(BOOL)isJailbroken{
    JailbreakTool *my = [self new];
    BOOL status1 = [my checkFile];
    BOOL status2 = [my canCallCydia];
    BOOL status3 = [my checkEnv];
    BOOL status = status1 || status2 || status3;
    return  status;
}

static const char* jailbreak_files[] = {
    "/Applications/Cydia.app",
    "/Applications/limera1n.app",
    "/Applications/greenpois0n.app",
    "/Applications/blackra1n.app",
    "/Applications/blacksn0w.app",
    "/Applications/redsn0w.app",
    "/Applications/Absinthe.app",
    "/User/Applications/",
    "/private/var/lib/apt/",
    NULL,
};

- (BOOL) checkFile {
    for(int i = 0; jailbreak_files[i] != NULL;i++){
        if([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:jailbreak_files[i]]]) {
//            NSLog(@"isjailbroken: %s", jailbreak_files[i]);
            return YES;
        }
    }
    return NO;
}

//能否唤起Cydia商店
-(BOOL)canCallCydia {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://"]]) {
        //    NSLog(@"The device is jail broken!");
        return YES;
    }
    //    NSLog(@"The device is NOT jail broken!");
    return NO;
}

//读取环境变量
-(BOOL)checkEnv {
    char *env = getenv("DYLD_INSERT_LIBRARIES");
    if (env) {
        return YES;
    }
    return NO;
}

@end
