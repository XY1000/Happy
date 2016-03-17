//
//  DuZiNetManager.h
//  逗你乐
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "DuanZiModel.h"
#import "DingYueModel.h"
/** 定义传入的类型*/
typedef NS_ENUM(NSUInteger, content_type) {
	
    content_type_DuanZi = -102,		//段子
    content_type_Video = -104,		//视频
};

@interface DuZiNetManager : BaseNetManager
/**
 *  获取段子的网络数据
 *
 *  @param type             传入的类型
 *  @param min              最短时间
 *  @param max              最长时间
 *  @param completionHandle
 *
 *  @return
 */
+ (id)getDuZiModelWithType:(content_type)type time:(NSString*)anyTime CompletionHandle:(void(^)(id model,NSError *error))completionHandle;

/**
 *  获取订阅的网络数据
 *
 *  @param min              最小时间
 *  @param max              最大时间
 *  @param completionHandle
 *
 *  @return 
 */
+ (id)getDingYueWithTime:(NSString*)anyTime CompletionHandle:(void(^)(id model,NSError *error))completionHandle;


@end
