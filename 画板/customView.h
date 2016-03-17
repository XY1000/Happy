//
//  customView.h
//  animation
//
//  Created by tmp on 16/2/4.
//  Copyright © 2016年 tmp. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, DrawStype) {
    DrawStypeLine,          //线条
    DrawStypeRect,          //矩形
    DrawStypeCircle,        //圆形
    DrawStypeStraight,      //虚线
    DrawStypeEraser,        //橡皮
    DrawStypeRepeal,        //撤销
    DrawStypeRemoveAll,     //清空
    DrawStypeNull,          //无操作
    DrawStypeOval,          //椭圆
};

@interface customView : UIScrollView

//线条颜色
@property(nonatomic,strong)UIColor *lineColor;
//线条宽度
@property(nonatomic)float lineWidth;

//画哪种图
@property(nonatomic)DrawStype stype;


@end
