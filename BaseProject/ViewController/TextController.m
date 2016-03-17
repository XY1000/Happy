//
//  TextController.m
//  逗你乐
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TextController.h"
#import "TextViewModel.h"
#import "TextCell.h"
#import "TextViewModel.h"
#import "TextDetailController.h"
@interface TextController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)TextViewModel *textVM;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipGes;

@end

@implementation TextController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	
	self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
		
		[self.textVM refreshDataCompletionHandle:^(NSError *error) {
			
			[self.tableView.header endRefreshing];
			[self.tableView reloadData];
			
			
		}];
		
		
	}];
	
	
	self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
		
		[self.textVM getMoreDataCompletionHandle:^(NSError *error) {
			
			[self.tableView.footer endRefreshing];
			[self.tableView reloadData];
		}];
		
	}];
	
	[self.tableView registerClass:[TextCell class] forCellReuseIdentifier:@"TextCell"];
	self.tableView.estimatedRowHeight = 30;
	self.tableView.rowHeight = UITableViewAutomaticDimension;
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.navigationItem.title = @"段子";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ====== UITableViewDelegate ======
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return self.textVM.rowNumber;
}
//设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 1;
}
//分区头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 5;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	TextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextCell" forIndexPath:indexPath];

	[cell.userIcoIV setImageWithURL:[self.textVM avatarWithRow:indexPath.section] placeholderImage:[UIImage imageNamed:@"picture_timeout"]];
	
	cell.userNameLb.text = [self.textVM nameWithRow:indexPath.section];
	cell.hotTopic = [self.textVM hotTopicWithRow:indexPath.section];
	cell.titleLb.text = [self.textVM titleWithRow:indexPath.section];
	
	cell.likeLb.text = [self.textVM favorWithRow:indexPath.section];
	cell.dislikeLb.text = [self.textVM diggWithRow:indexPath.section];
	cell.commentLb.text = [self.textVM commentWithRow:indexPath.section];
	cell.shareLb.text = [self.textVM shareCountWithRow:indexPath.section];
	
	
	return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	TextCell *vcell = [tableView cellForRowAtIndexPath:indexPath];
	
		TextDetailController *vdc = [TextDetailController new];
		vdc.textCell = vcell;
		vdc.groupId = [self.textVM groupIdWithRow:indexPath.section];
		[self.navigationController pushViewController:vdc animated:YES];
	
	
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 150;
}





- (TextViewModel *)textVM {
	if(_textVM == nil) {
		_textVM = [[TextViewModel alloc] init];
	}
	return _textVM;
}



- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	if (_textVM == nil) {
		[self showProgress];
		[self.textVM refreshDataCompletionHandle:^(NSError *error) {
			[self hideProgress];
			[self.tableView reloadData];
		}];
	}else{
	[self.tableView reloadData];
	}
}
#pragma mark ----手势-------
- (IBAction)GestureAction:(UISwipeGestureRecognizer *)sender {
	
	
		self.tabBarController.selectedIndex --;
	
	
}
- (IBAction)rightGesture:(UISwipeGestureRecognizer *)sender {
	self.tabBarController.selectedIndex++;
}

@end
