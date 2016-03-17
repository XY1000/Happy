//
//  VideoController.m
//  逗你乐
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoController.h"
#import "VideoCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "VideoDetailController.h"
#import "VideoViewModel.h"
@interface VideoController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)VideoViewModel *videoVM;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipGes;

@end

@implementation VideoController
{
	VideoCell *_tempVCell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
	self.swipGes.direction = UISwipeGestureRecognizerDirectionLeft;
	self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
		
		[self.videoVM refreshDataCompletionHandle:^(NSError *error) {
			
			[self.tableView.header endRefreshing];
			[self.tableView reloadData];
			
			
		}];
		
		
	}];
	
	self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
		
		[self.videoVM getMoreDataCompletionHandle:^(NSError *error) {
			
			[self.tableView.footer endRefreshing];
			[self.tableView reloadData];
		}];
		
	}];
	
	[self.tableView registerClass:[VideoCell class] forCellReuseIdentifier:@"VideoCell"];
	
	self.navigationItem.title = @"视频";
	
}
#pragma mark ====== UITableViewDelegate ======
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return self.videoVM.rowNumber;
}
//设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 1;
}
kRemoveCellSeparator
//设置显示的内容
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoCell" forIndexPath:indexPath];

	[cell.userIcoIV setImageWithURL:[self.videoVM avatarWithRow:indexPath.section] placeholderImage:[UIImage imageNamed:@"picture_timeout"]];
	
	cell.userNameLb.text = [self.videoVM nameWithRow:indexPath.section];
	cell.hotTopic = [self.videoVM hotTopicWithRow:indexPath.section];
	cell.titleLb.text = [self.videoVM titleWithRow:indexPath.section];
	
	[cell.videoIV setImageWithURL:[self.videoVM videoImgWithRow:indexPath.section] placeholderImage:[UIImage imageNamed:@"picture_timeout"]];
	
	cell.playCountLb.text = [self.videoVM playCountWithRow:indexPath.section];
	cell.durationLb.text = [self.videoVM durationWithRow:indexPath.section];
	cell.likeLb.text = [self.videoVM favorWithRow:indexPath.section];
	cell.dislikeLb.text = [self.videoVM diggWithRow:indexPath.section];
	cell.commentLb.text = [self.videoVM commentWithRow:indexPath.section];
	cell.shareLb.text = [self.videoVM shareCountWithRow:indexPath.section];
	cell.playSource = [self.videoVM mp4URLWithRow:indexPath.section];
	
	return cell;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 250;
}
//分区头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 5;
}
#pragma mark ----点击单元格------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

	
	VideoCell *vcell = [tableView cellForRowAtIndexPath:indexPath];
	
		VideoDetailController *vdc = [VideoDetailController new];		
		vdc.videoCell = vcell;
		vdc.groupId = [self.videoVM groupIdWithRow:indexPath.section];
		[self.navigationController pushViewController:vdc animated:YES];

	
}


- (VideoViewModel *)videoVM {
	if(_videoVM == nil) {
		_videoVM = [[VideoViewModel alloc] init];
	}
	return _videoVM;
}
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	if (_videoVM == nil) {
		[self showProgress];
		[self.videoVM refreshDataCompletionHandle:^(NSError *error) {
			[self hideProgress];
			[self.tableView reloadData];
		}];
	}else{
	[self.tableView reloadData];
	}
}

- (IBAction)swipAvtion:(UISwipeGestureRecognizer *)sender {
	
	self.tabBarController.selectedIndex ++;
	NSLog(@"ad");
}


@end
