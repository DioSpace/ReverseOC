//
//  StudyViewController.m
//  ObjectiveC
//
//  Created by William on 2018/10/22.
//  Copyright © 2018年 William. All rights reserved.
//

#import "DeviceViewController.h"
#import "ProxyViewController.h"
#import "DeviceIDViewController.h"
#import "JailbreakViewController.h"

@interface DeviceViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation DeviceViewController

-(void)loadData{//添加controller
    self.dataArray = [NSMutableArray array];
    
    JailbreakViewController *jailbreakVC = [JailbreakViewController new];
    jailbreakVC.title = @"越狱相关";
    [self.dataArray addObject:jailbreakVC];
    
    DeviceIDViewController *deviceidVC = [DeviceIDViewController new];
    deviceidVC.title = @"设备ID";
    [self.dataArray addObject:deviceidVC];
    
    ProxyViewController *proxyVC = [ProxyViewController new];
    proxyVC.title = @"检测代理";
    [self.dataArray addObject:proxyVC];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Device";
    [self loadData];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELLID];
    self.myTableView.tableFooterView = [UIView new];
}

//Sections数量
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//Row数量
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if(cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLID];
    }
    UIViewController *anyVC = _dataArray[indexPath.row];
    cell.textLabel.text = anyVC.title;
    return cell;
}
//点击cell事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *anyVC = _dataArray[indexPath.row];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:anyVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

@end
