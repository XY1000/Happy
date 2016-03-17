//
//  Utility.m
//  MeridianStreamer
//
//  Created by PP－mac001 on 15/9/9.
//  Copyright (c) 2015年 PP－mac001. All rights reserved.
//

#import "Utility.h"
#define DEFAULT_VOID_COLOR [UIColor whiteColor]

@implementation Utility

#pragma mark 正则匹配身份证号
+ (BOOL)checkUserIdCard:(NSString *)idCard
{
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:idCard];
    return isMatch;
}


#pragma mark 正则匹配用户姓名,20位的中文或英文
+ (BOOL)checkUserName : (NSString *) userName
{
    NSString *pattern = @"^[a-zA-Z一-龥]{1,20}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:userName];
    return isMatch;
}

#pragma mark 正则匹配手机号
+ (BOOL)checkUserTelNumber:(NSString *) telNumber
{
    //    NSString *pattern = @"^1+[3578]+\d{9}";
    NSString * pattern = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}

#pragma mark 16进制颜色转换
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    
    if ([cString length] < 6)
        return DEFAULT_VOID_COLOR;
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return DEFAULT_VOID_COLOR;
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

#pragma mark 时间间隔
+ (CGFloat)intervalTimeWithCreatetime:(NSString *)createtime {
    NSString *createTimeStr = [createtime substringToIndex:[createtime length]-1];
    //时间戳转成时间
    NSDate * foreDate = [NSDate dateWithTimeIntervalSince1970:[createTimeStr floatValue]];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //当前时间
    NSDate *nowDate = [NSDate date];
    //时间间隔
    NSTimeInterval intervalTime = [nowDate timeIntervalSinceDate:foreDate];
    CGFloat time = intervalTime;
    return time;
}

#pragma mark 时间戳转时间
+ (NSString *)timeWithString:(NSString *)string andType:(NSString *)type{
    NSTimeInterval time=[string doubleValue];//因为时差问题要加8小时 == 28800 sec
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:type];
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    return currentDateStr;
}

#pragma mark 拨打电话
+(void)callPhone:(NSString *)phoneNo view:(UIView *)view{
    NSString * str=[NSString stringWithFormat:@"tel:%@",phoneNo];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [view addSubview:callWebview];
}

#pragma mark
+(float)heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width{
    NSAttributedString *valuestr = [[NSAttributedString alloc] initWithString:value attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
    CGSize textsize = [valuestr boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    return textsize.height;
}

#pragma mark
+(float) widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height
{
    NSAttributedString *valuestr = [[NSAttributedString alloc] initWithString:value attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
    CGSize textsize = [valuestr boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    
    return textsize.width;
}

#pragma mark 得到内容的自适应高度
+ (CGFloat)contentHeightWithSize:(CGFloat)size width:(CGFloat)width string:(NSString *)string{
    //第一个参数：是进行自适应的尺寸  第二个参数：布局格式 第三个参数：字符串的属性列表  第四个忽略
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]} context:nil];
    
    return rect.size.height;
}

#pragma mark 字符串分割
+ (NSArray *)arrayWithString:(NSString *)string andFuhao:(NSString *)fuhao {
    NSArray *array = [string componentsSeparatedByString:fuhao];
    return array;
}

#pragma mark Email 邮箱

+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
@end
