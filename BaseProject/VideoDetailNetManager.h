//
//  VideoDetailNetManager.h
//  逗你乐
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "VideoDetailModel.h"
@interface VideoDetailNetManager : BaseNetManager

+(id)getVideoDetailWithGroupId:(NSString *)groupId Offset:(NSString*)offset CompletionHandle:(void(^)(id model,NSError *erorr))completionHandle;

@end
