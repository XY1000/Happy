//
//  customView.m
//  animation
//
//  Created by tmp on 16/2/4.
//  Copyright © 2016年 tmp. All rights reserved.
//

#import "customView.h"
#import "customeBezierPath.h"

@implementation customView
{
    customeBezierPath *path;
    NSMutableArray *allPath;
    CGPoint origPoint;//起始点
    NSInteger _tmp;//用来记录类型（对撤销，清空之后的处理）
}


- (void)awakeFromNib{
    
    [super awakeFromNib];
    [self initData];
    
}
//什么都没有时，默认选项
- (void)initData{
    allPath = [NSMutableArray array];
    self.lineWidth = 1;
    self.lineColor = [UIColor flatBlackColor];
    self.backgroundColor = [UIColor flatWhiteColor];
    self.stype = DrawStypeNull;
}


-(void)drawRect:(CGRect)rect{
    
    if (self.stype == DrawStypeNull) {
        
        return;
    }
    
    
    for (customeBezierPath *pn in allPath) {
        
        [pn.strokeColor setStroke];
        
        [pn stroke];
    }
    
    //撤销，删除
    if (self.stype == DrawStypeRepeal || self.stype == DrawStypeRemoveAll) {
        
        self.stype = _tmp;
        
        return;
    }
    
    [self.lineColor setStroke];
    path.strokeColor = self.lineColor;
    
    //橡皮
    if (self.stype == DrawStypeEraser) {
        
        [self.backgroundColor setStroke];
        path.strokeColor = self.backgroundColor;
    }
    
    
    [path stroke];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (self.stype == DrawStypeNull) {
        
        return;
    }
    
    UITouch *touch = touches.allObjects.firstObject;
    
    origPoint = [touch locationInView:self];
    
    path = [customeBezierPath bezierPath];

    [path moveToPoint:[touch locationInView:self]];
  

    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (self.stype == DrawStypeNull) {
        
        return;
    }
    
    UITouch *touch = touches.allObjects.firstObject;
    CGPoint point = [touch locationInView:self];
    
    switch (self.stype) {
        case DrawStypeLine: {
            
            [path addLineToPoint:point];
            
            
            break;
        }
        case DrawStypeRect: {
            
            path = [customeBezierPath bezierPathWithRect:CGRectMake(origPoint.x,origPoint.y ,point.x - origPoint.x, point.y - origPoint.y)];
            
            
            break;
        }
        case DrawStypeCircle: {
            
            float radius = fabs(sqrt(powf(point.x - origPoint.x, 2)+ powf(point.y - origPoint.y, 2)));
            
            path = [customeBezierPath bezierPathWithArcCenter:origPoint radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
           
            
            
            break;
        }
        case DrawStypeStraight: {
            
            [path addLineToPoint:point];
            CGFloat dash[] = {10,10};
            [path setLineDash:dash count:2 phase:0];
           
            
            break;
        }
        case DrawStypeEraser: {
            
           
            
        [path addLineToPoint:point];
            
            break;
        }
       
        case DrawStypeOval: {
            
            path = [customeBezierPath bezierPathWithOvalInRect:CGRectMake(origPoint.x,origPoint.y ,point.x - origPoint.x, point.y - origPoint.y)];
            
            break;
        }
            default:
            
            break;
    }
  
    path.lineWidth = self.lineWidth;
    
    [self setNeedsDisplay];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (self.stype == DrawStypeNull) {
        
        return;
    }
    
    [allPath addObject:path];
    
}

- (void)setStype:(DrawStype)stype{
    
    _tmp = _stype;
    _stype = stype;
    
    if (stype == DrawStypeRepeal) {
        
        [allPath removeLastObject];
      
        [self setNeedsDisplay];
        
       
        
    }else if (stype == DrawStypeRemoveAll){
        
        [allPath removeAllObjects];
        
        [self setNeedsDisplay];
        
        
    }
    
    
    
}


@end
