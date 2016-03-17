//
//  DuZiNetManager.m
//  逗你乐
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuZiNetManager.h"
#import "address.h"

@implementation DuZiNetManager

+(id)getDingYueWithTime:(NSString*)anyTime CompletionHandle:(void (^)(id, NSError *))completionHandle
{
	
	return [self GET:kDingYue parameters:nil completionHandler:^(id responseObj, NSError *error) {
		completionHandle([DingYueModel objectWithKeyValues:responseObj],error);
		
	}];
}
+(id)getDuZiModelWithType:(content_type)type time:(NSString*)anyTime  CompletionHandle:(void (^)(id, NSError *))completionHandle
{
	NSString *path = [NSString stringWithFormat:@"?content_type=%ld&iid=3207398618&idfa=idfa&version_code=4.4.2&device_type=iPhone%%205%%20(Global)&aid=7&os_version=9.0.2&screen_width=640&vid=A71945F4-10DB-49E0-977F-B90A896F483E&device_id=6741877917&os_api=18&app_name=joke_essay&device_platform=iphone&ac=WIFI&openudid=3d360c364f212291b31eb361cca4152cd43ca088&channel=App%%20Store&content_type=%ld&count=30&essence=1&message_cursor=0&%@&mpic=1",type,type,anyTime];
	
	return [self GET:[kDuanzi stringByAppendingString:path] parameters:nil completionHandler:^(id responseObj, NSError *error) {
		
		completionHandle([DuanZiModel objectWithKeyValues:responseObj],error);
	}];
}

@end
