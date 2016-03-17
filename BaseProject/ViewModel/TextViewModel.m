//
//  TextViewModel.m
//  逗你乐
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TextViewModel.h"
#import "DuZiNetManager.h"
#import "DuanZiModel.h"
@implementation TextViewModel
{
		NSString *_tmp;
		DuanZiModel *_duanzi;
}



- (Data2GroupModel *)getData2GroupWithRow:(NSInteger)row
{
	DataDataModel *model = self.dataArr[row];
	
	return model.group;
}
/** 头像*/
- (NSURL *)avatarWithRow:(NSInteger)row{
	
	Data2GroupUserModel *user = [self getData2GroupWithRow:row].user;
	return [NSURL URLWithString:user.avatar_url];
}

/** 用户名*/
- (NSString *)nameWithRow:(NSInteger)row{
	Data2GroupUserModel *user = [self getData2GroupWithRow:row].user;
	return user.name;
}

/** 标题*/
- (NSString *)titleWithRow:(NSInteger)row{
	return [self getData2GroupWithRow:row].text;
}

/** 点赞*/
- (NSString*)favorWithRow:(NSInteger)row{
	
	return [NSString stringWithFormat:@"%ld",[self getData2GroupWithRow:row].favorite_count];
	
}

/** 不喜欢*/
- (NSString*)diggWithRow:(NSInteger)row{
	return [NSString stringWithFormat:@"%ld",[self getData2GroupWithRow:row].digg_count];
}

/** 评论*/
- (NSString*)commentWithRow:(NSInteger)row{
	return [NSString stringWithFormat:@"%ld",[self getData2GroupWithRow:row].comment_count];
}

/** 转发*/
- (NSString*)shareCountWithRow:(NSInteger)row{
	return [NSString stringWithFormat:@"%ld",[self getData2GroupWithRow:row].share_count ];
}

/** 是不是热点*/
- (BOOL)hotTopicWithRow:(NSInteger)row{
	
	return [self getData2GroupWithRow:row].is_neihan_hot;
	
}
/** groupID*/
- (NSString *)groupIdWithRow:(NSInteger)row{
	
	return [NSString stringWithFormat:@"%lld",[self getData2GroupWithRow:row].group_id];
	
	
}
/** 获取数据*/
- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
	
	[DuZiNetManager getDuZiModelWithType:(content_type_DuanZi) time:_tmp CompletionHandle:^(DuanZiModel *model, NSError *error) {
		
		_duanzi = model;
		//去除广告
		NSArray *arr = model.data.data;
		NSMutableArray *all = [NSMutableArray array];
		for (DataDataModel *ddm in arr) {
			
			if (ddm.type == 5) {
				
				continue;
			}
			[all addObject:ddm];
		}
		//判断是刷新，还是加载更多
		if ([_tmp hasPrefix:@"min"]) {
			
			[self.dataArr removeAllObjects];
			
		}
		
		[self.dataArr addObjectsFromArray:all];
		
		
		
		completionHandle(error);
		
	}];
	
	
}
/** 刷新*/
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
	
	if (!_tmp) {
		_tmp = @"min_time=1447044022";
	}else{
		_tmp = [NSString stringWithFormat:@"min_time=%ld",_duanzi.data.min_time];
	}
	
	[self getDataFromNetCompleteHandle:completionHandle];
}
/** 加载更多*/
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
	_tmp = [NSString stringWithFormat:@"max_time=%.0lf",_duanzi.data.max_time];
	[self getDataFromNetCompleteHandle:completionHandle];
}

- (instancetype)init
{
	if (self = [super init]) {
		
		_tmp = nil;
	}
	return self;
}

@end
