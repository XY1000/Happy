//
//  VideoViewModel.h
//  逗你乐
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface VideoViewModel : BaseViewModel

/** 标题*/
- (NSString *)titleWithRow:(NSInteger)row;

/** 视频*/
- (NSURL *)mp4URLWithRow:(NSInteger)row;

/** 视频图片*/
- (NSURL *)videoImgWithRow:(NSInteger)row;

/** 点赞*/
- (NSString*)favorWithRow:(NSInteger)row;

/** 不喜欢*/
- (NSString*)diggWithRow:(NSInteger)row;

/** 评论*/
- (NSString*)commentWithRow:(NSInteger)row;

/** 转发*/
- (NSString*)shareCountWithRow:(NSInteger)row;

/** 播放次数*/
- (NSString*)playCountWithRow:(NSInteger)row;

/** 时长*/
- (NSString *)durationWithRow:(NSInteger)row;

/** 是不是热点*/
- (BOOL)hotTopicWithRow:(NSInteger)row;

/** groupID*/
- (NSString *)groupIdWithRow:(NSInteger)row;
@end
