//
//  VideoDetailViewModel.h
//  逗你乐
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface VideoDetailViewModel : BaseViewModel



/** 内容*/
- (NSString *)textWithRow:(NSInteger)row;
/** 赞*/
- (NSString *)favourWithRow:(NSInteger)row;
/** 初始化*/
- (instancetype)initWithGroupId:(NSString *)groupId NS_DESIGNATED_INITIALIZER;
/** ID*/
@property (nonatomic,strong)NSString *groupId;

@end
