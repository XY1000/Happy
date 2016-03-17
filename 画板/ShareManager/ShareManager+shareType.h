//
//  ShareManager+shareType.h
//  Projectflow
//
//  Created by tmp on 15/12/29.
//  Copyright © 2015年 Mirror. All rights reserved.
//

#import "ShareManager.h"



@interface ShareManager (shareType)

+(void) ShareByWeChat:(UIViewController *)Controller content:(NSString *)content;
+(void) ShareByQQ:(UIViewController *)Controller content:(NSString *)content;
+(void) ShareByWechatTimeline:(UIViewController *)Controller content:(NSString *)content;



@end
