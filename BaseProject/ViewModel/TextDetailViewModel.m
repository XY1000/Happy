//
//  TextDetailViewModel.m
//  逗你乐
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TextDetailViewModel.h"
#import "VideoDetailNetManager.h"
@implementation TextDetailViewModel
{
	NSInteger _pageId;
	
}

- (VideoDataRecent_CommentsModel *)getRecentCommentWithRow:(NSInteger)row{
	
	
	return self.dataArr[row];
	
}

/** 用户名*/
- (NSString *)nameWithRow:(NSInteger)row{
	return [self getRecentCommentWithRow:row].user_name;
}
/** 头像*/
- (NSURL *)avatarWithRow:(NSInteger)row
{
	return [NSURL URLWithString:[self getRecentCommentWithRow:row].avatar_url];
}
/** 内容*/
- (NSString *)textWithRow:(NSInteger)row{
	return [self getRecentCommentWithRow:row].text;
}
/** 赞*/
- (NSString *)favourWithRow:(NSInteger)row
{
	return [NSString stringWithFormat:@"%ld",[self getRecentCommentWithRow:row].digg_count];
}



- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
	
	[VideoDetailNetManager getVideoDetailWithGroupId:_groupId Offset:[NSString stringWithFormat:@"%ld",_pageId] CompletionHandle:^(VideoDetailModel* model, NSError *erorr) {
		if (_pageId == 0) {
			[self.dataArr removeAllObjects];
		}
		[self.dataArr addObjectsFromArray:model.data.recent_comments];
		completionHandle(erorr);
	}];
}

/** 刷新*/
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
	_pageId = 0;
	
	[self getDataFromNetCompleteHandle:completionHandle];
}
/** 获取更多*/
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
	_pageId += 20;
	[self getDataFromNetCompleteHandle:completionHandle];
}

/** 初始化*/
- (instancetype)initWithGroupId:(NSString *)groupId
{
	if (self = [super init]) {
		
		self.groupId = groupId;
	}
	return self;
}
@end
