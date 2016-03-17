//
//  LeftViewController.m
//  逗你乐
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"


@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource,RESideMenuDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *itemNames;
@end

@implementation LeftViewController
- (NSArray *)itemNames{
	return @[@"头条",@"独家",@"暗黑3",@"魔兽",@"风暴",@"炉石",@"星际2",@"守望",@"图片",@"攻略",@"幻化",@"趣闻",@"COS",@"美女"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.tableView.tableFooterView = [UIView new];
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
	self.sideMenuViewController.delegate = self;
}

#pragma mark -----SideMenuDelegate
-(void)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController
{
	self.tabBarController.tabBar.hidden = YES;
}
- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController
{
	self.tabBarController.tabBar.hidden = NO;
}


#pragma mark =====UITableViewDelegate=====

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self itemNames].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

	cell.textLabel.text = self.itemNames[indexPath.row];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.contentView.backgroundColor = [UIColor clearColor];
	cell.backgroundColor =[UIColor clearColor];
	return cell;
}
/** 点击单元格*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	[self.delegate showControllWithRow:indexPath.row];
	[self.sideMenuViewController hideMenuViewController];
	
}




/** 提供题目数组 */
+ (NSArray *)itemNames{
	return @[@"头条",@"独家",@"暗黑3",@"魔兽",@"风暴",@"炉石",@"星际2",@"守望",@"图片",@"攻略",@"幻化",@"趣闻",@"COS",@"美女"];
}


- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] init];
		[self.view addSubview:_tableView];
		[_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
			make.centerY.mas_equalTo(0);
			make.width.mas_equalTo(kWindowW /2.0);
			make.height.mas_equalTo(kWindowH / 2.0);
			make.left.mas_equalTo(0);
		}];
		_tableView.backgroundColor = [UIColor clearColor];
	}
	return _tableView;
}

@end
