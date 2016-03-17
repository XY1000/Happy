//
//  TextDetailController.m
//  逗你乐
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TextDetailController.h"
#import "VideoDetailCell.h"
#import "TextDetailViewModel.h"

@interface TextDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)TextDetailViewModel *textDVM;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation TextDetailController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self.tableView registerClass:[VideoDetailCell class] forCellReuseIdentifier:@"DetailCell"];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.navigationItem.title = @"详情";
	self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
		
		[self.textDVM refreshDataCompletionHandle:^(NSError *error) {
			
			[self.tableView reloadData];
			[self.tableView.header endRefreshing];
		}];
		
	}];
	[self showProgress];
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.textDVM refreshDataCompletionHandle:^(NSError *error) {
			[self hideProgress];
			[self.tableView reloadData];
			[self.tableView.header endRefreshing];
		}];
		
	});
	
	self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
		[self.textDVM getMoreDataCompletionHandle:^(NSError *error) {
			
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
		return self.textDVM.rowNumber;
	}
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == 0) {
		self.textCell.selectionStyle = UITableViewCellSelectionStyleNone;
		return self.textCell;
	}
	
	VideoDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell" forIndexPath:indexPath];
	
	[cell.iconIV setImageWithURL:[self.textDVM avatarWithRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"picture_timeout"]];
	cell.nameLb.text = [self.textDVM nameWithRow:indexPath.row];
	cell.textLb.text = [self.textDVM textWithRow:indexPath.row];
	cell.favourLb.text = [self.textDVM favourWithRow:indexPath.row];
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








- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] init];
		[self.view addSubview:_tableView];
		[_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
			make.edges.mas_equalTo(0);
			
		}];
		
	}
	return _tableView;
}

- (TextDetailViewModel *)textDVM {
	if(_textDVM == nil) {
		_textDVM = [[TextDetailViewModel alloc] initWithGroupId:self.groupId];
	}
	return _textDVM;
}

@end
