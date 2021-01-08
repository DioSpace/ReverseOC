//
//  OtherViewController.m
//  ObjectiveC
//
//  Created by hello on 2019/3/17.
//  Copyright © 2019 William. All rights reserved.
//

#import "OtherViewController.h"
#import "ReverseCodeVC.h"

@interface OtherViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation OtherViewController

-(void)loadData{//添加controller
    self.dataArray = [NSMutableArray array];
    
    ReverseCodeVC *reverseCodeVC = [ReverseCodeVC new];
    reverseCodeVC.title = @"逆向会用到的一些代码";
    [self.dataArray addObject:reverseCodeVC];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Other";
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
