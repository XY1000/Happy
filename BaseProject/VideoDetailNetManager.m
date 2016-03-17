//
//  VideoDetailNetManager.m
//  逗你乐
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoDetailNetManager.h"
#import "address.h"
@implementation VideoDetailNetManager
+(id)getVideoDetailWithGroupId:(NSString *)groupId Offset:(NSString*)offset  CompletionHandle:(void (^)(id, NSError *))completionHandle
{
	NSString *path = [NSString stringWithFormat:@"?iid=3207398618&idfa=idfa&version_code=4.4.2&device_type=iPhone%%205%%20(Global)&aid=7&os_version=9.0.2&screen_width=640&vid=A71945F4-10DB-49E0-977F-B90A896F483E&device_id=6741877917&os_api=18&app_name=joke_essay&device_platform=iphone&ac=WIFI&openudid=3d360c364f212291b31eb361cca4152cd43ca088&channel=App%%20Store&count=20&device_id=6741877917&group_id=%@&offset=%@&sort=hot&tag=joke",groupId,offset];
	path = [kVideoDetail stringByAppendingString:path];
	return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
		
		
		completionHandle([VideoDetailModel objectWithKeyValues:responseObj],error);
		
	}];
}
@end
