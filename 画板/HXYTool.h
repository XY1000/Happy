//
//  HXYTool.h
//  SuperIntegration
//
//  Created by tmp on 16/1/29.
//  Copyright © 2016年 PP－mac001. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HXYTool : NSObject

/**
 *  @author hxy
 *
 *  对用户登陆状态的封装
 *
 *  @param user    只需传入self，对未登录进行统一的操作
 *  @param noLogin 未登录时进行的补充操作
 *  @param login   登录时进行的操作
 */
+ (void)userNotLogin:(_Nonnull id)user notlogin:(void(^ _Nullable )())noLogin login:(void(^ _Nullable )())login;





@end
