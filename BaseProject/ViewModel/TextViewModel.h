//
//  TextViewModel.h
//  逗你乐
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface TextViewModel : BaseViewModel


/** 标题*/
- (NSString *)titleWithRow:(NSInteger)row;

/** 点赞*/
- (NSString*)favorWithRow:(NSInteger)row;

/** 不喜欢*/
- (NSString*)diggWithRow:(NSInteger)row;

/** 评论*/
- (NSString*)commentWithRow:(NSInteger)row;

/** 转发*/
- (NSString*)shareCountWithRow:(NSInteger)row;

/** 是不是热点*/
- (BOOL)hotTopicWithRow:(NSInteger)row;


/** groupID*/
- (NSString *)groupIdWithRow:(NSInteger)row;
@end
