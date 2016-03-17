//
//  ShareManager.h
//  Projectflow
//
//  Created by Bert on 12/14/15.
//  Copyright © 2015 Mirror. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMSocial.h>
@interface ShareManager : NSObject <UMSocialUIDelegate>
+(void) ShareByWeChat:(UIViewController *)Controller;
+(void) ShareByQQ:(UIViewController *)Controller;
+(void) ShareByWechatTimeline:(UIViewController *)Controller;
@end
