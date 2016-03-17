//
//  VideoDetailController.m
//  逗你乐
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoDetailController.h"
#import "VideoDetailViewModel.h"
#import "VideoDetailCell.h"
@interface VideoDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)VideoDetailViewModel *VDVM;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation VideoDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self.tableView registerClass:[VideoDetailCell class] forCellReuseIdentifier:@"DetailCell"];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.navigationItem.title = @"详情";
	self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
		
		[self.VDVM refreshDataCompletionHandle:^(NSError *error) {
			
			[self.tableView reloadData];
			[self.tableView.header endRefreshing];
		}];
		
	}];
 
	[self showProgress];
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.VDVM refreshDataCompletionHandle:^(NSError *error) {
			[self hideProgress];
			[self.tableView reloadData];
			[self.tableView.header endRefreshing];
		}];
		
	});
	self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
		[self.VDVM getMoreDataCompletionHandle:^(NSError *error) {
			
			[self.tableView reloadData];
			[self.tableView.footer endRefreshing];
			
		}];
		
	}];
	
		self.tableView.tableFooterView = [UIView new];
	
	
}


#pragma mark -----UITableViewDelegate----
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section == 0) {
		return 1;
	}else{
		return self.VDVM.rowNumber;
	}
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == 0) {
		self.videoCell.selectionStyle = UITableViewCellSelectionStyleNone;
		return self.videoCell;
	}
	
	VideoDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell" forIndexPath:indexPath];
	
	[cell.iconIV setImageWithURL:[self.VDVM avatarWithRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"picture_timeout"]];
	cell.nameLb.text = [self.VDVM nameWithRow:indexPath.row];
	cell.textLb.text = [self.VDVM textWithRow:indexPath.row];
	cell.favourLb.text = [self.VDVM favourWithRow:indexPath.row];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == 0) {
		
		return 250;
	}
	return 80;
}






- (VideoDetailViewModel *)VDVM {
	if(_VDVM == nil) {
		_VDVM = [[VideoDetailViewModel alloc] initWithGroupId:_groupId];
	}
	return _VDVM;
}

- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] init];
		[self.view addSubview:_tableView];
		[_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
			make.edges.mas_equalTo(0);
			
		}];
//		_tableView.estimatedRowHeight = 100;
//		_tableView.rowHeight = UITableViewAutomaticDimension;
	}
	return _tableView;
}

@end
