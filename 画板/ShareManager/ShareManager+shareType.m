//
//  ShareManager+shareType.m
//  Projectflow
//
//  Created by tmp on 15/12/29.
//  Copyright © 2015年 Mirror. All rights reserved.
//

#import "ShareManager+shareType.h"


@implementation ShareManager (shareType)

+ (void)ShareByQQ:(UIViewController *)Controller content:(NSString *)content{
    

    
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToQQ] content:content image:[UIImage imageNamed:@"logo"] location:nil urlResource:nil presentedController:Controller completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            DLog(@"分享成功！");
        }
    }];

    
}

+ (void)ShareByWeChat:(UIViewController *)Controller content:(NSString *)content{
   
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatSession] content:content image:[UIImage imageNamed:@"logo"] location:nil urlResource:nil presentedController:Controller completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            DLog(@"分享成功！");
        }
    }];
}

+ (void)ShareByWechatTimeline:(UIViewController *)Controller content:(NSString *)content{
    
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToWechatTimeline] content:content image:[UIImage imageNamed:@"logo"] location:nil urlResource:nil presentedController:Controller completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            DLog(@"分享成功！");
        }
    }];
}

@end
