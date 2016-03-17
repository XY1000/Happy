//
//  Utility.h
//  MeridianStreamer
//
//  Created by PP－mac001 on 15/9/9.
//  Copyright (c) 2015年 PP－mac001. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

/**
 *  检查用户的身份证号码
 */
+ (BOOL)checkUserIdCard:(NSString *)idCard;
/**
 *  正则匹配用户姓名,20位的中文或英文
 */
+ (BOOL)checkUserName:(NSString *)userName;
/**
 *  电话号码
 */
+ (BOOL)checkUserTelNumber:(NSString *)telNumber;
/**
 *  16进制颜色转换为UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

/**
 *
 *  检查Email格式
 *
 */
+ (BOOL) validateEmail:(NSString *)email;
@end
